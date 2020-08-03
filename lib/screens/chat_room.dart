import 'package:chat_app/helper/contstants.dart';
import 'package:chat_app/helper/helper_functions.dart';
import 'package:chat_app/screens/search.dart';
import 'package:chat_app/services/authentication.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/shared/app_colors.dart';
import 'package:chat_app/widgets/chats_tile.dart';
import 'package:chat_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = DatabaseMethods();
  Stream chatsStream;

  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Chatify", style: TextStyle(fontSize: 28)),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              authMethods.signOut();
              HelperFunctions.saveUserLoggedKeyPref(false);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app,
                  color: AppColors.inputLineEnabledColor),
            ),
          )
        ],
      ),

       */
      body: Column(
        children: <Widget>[
          buildTopPanel(),
          chatRoomList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameKeyPref();
    databaseMethods.getChatRoom(Constants.myName).then((value) {
      setState(() {
        chatsStream = value;
      });
    });
    setState(() {});
  }

  Widget chatRoomList() {
    return StreamBuilder(
      stream: chatsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatsTile(
                      snapshot.data.documents[index].data["chatroomId"]
                          .toString()
                          .replaceAll("_", "")
                          .replaceAll(Constants.myName, ""),
                      snapshot.data.documents[index].data["chatroomId"]);
                })
            : Expanded(child: Center(child: Text("Nothing to show")));
      },
    );
  }

  buildTopPanel() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 40,
          bottom: 30,
          left: 30,
          right: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientButtonFirstColor,
                AppColors.gradientButtonSecondColor
              ]),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Chatify", style: appBarTextStyle()),
          Text(Constants.myName, style: mediumTextStyle()),
        ],
      ),
    );
  }
}
