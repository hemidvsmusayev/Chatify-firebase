import 'package:chat_app/helper/authenticate.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                AppColors.gradientButtonFirstColor,
                AppColors.gradientButtonSecondColor
              ]),
        ),
        child: Column(
          children: <Widget>[
            buildTopPanel(),
            chatRoomList(),
          ],
        ),
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
            ? Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ChatsTile(
                            snapshot.data.documents[index].data["chatroomId"]
                                .toString()
                                .replaceAll("_", "")
                                .replaceAll(Constants.myName, ""),
                            snapshot.data.documents[index].data["chatroomId"]);
                      }),
                  decoration: BoxDecoration(
                      color: AppColors.kScaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                ),
              )
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
      child: Row(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Chatify", style: appBarTextStyle()),
                //Text(Constants.myName, style: appBarSecondTextStyle())
              ]),
          Spacer(),
          IconButton(
            onPressed: () {
              authMethods.signOut();
              HelperFunctions.saveUserLoggedKeyPref(false);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}
