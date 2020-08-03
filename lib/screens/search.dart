import 'package:chat_app/helper/contstants.dart';
import 'package:chat_app/screens/conversation.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/shared/app_colors.dart';
import 'package:chat_app/widgets/search_button.dart';
import 'package:chat_app/widgets/search_input_decoration.dart';
import 'package:chat_app/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = DatabaseMethods();
  TextEditingController searchTxt = TextEditingController();

  QuerySnapshot searchSnapshot;

  bool isLoading = false;
  bool haveUserSearched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[buildTopPanel(), searchList()],
        ),
      ),
    );
  }

  initiateSearch() async {
    if (searchTxt.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
    }
    await databaseMethods.getUserByUsername(searchTxt.text).then((snapshot) {
      searchSnapshot = snapshot;
      print(searchSnapshot.documents[0].data);
      setState(() {
        isLoading = false;
        haveUserSearched = true;
      });
    });
  }

  Widget searchList() {
    return haveUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return userTile(searchSnapshot.documents[index].data["name"],
                  searchSnapshot.documents[index].data["email"]);
            })
        : Expanded(child: Center(child: Text("Nothing to show")));
  }

  Widget userTile(String userName, String userEmail) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: simpleTextStyle()),
              Text(userEmail, style: simpleTextStyle())
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              createChatRoom(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(24)),
              child: Text("Message", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  createChatRoom(String userName) {
    if (userName != Constants.myName) {
      String chatRoomId = getChatRoomId(userName, Constants.myName);

      List<String> users = [userName, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatroomId": chatRoomId
      };
      databaseMethods.createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConversationScreen(chatRoomId)));
    } else {
      print("you can not send message to yourself");
    }
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  buildTopPanel() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top + 60,
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
          Text("Search user", style: appBarTextStyle()),
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                      controller: searchTxt,
                      style:
                      TextStyle(color: AppColors.kScaffoldBackgroundColor),
                      decoration: buildSearchInputDecoration("Type here..."))),
              GestureDetector(
                  onTap: initiateSearch,
                  child: buildSearchBtn("assets/images/search_white.png")),
            ],
          ),
        ],
      ),
    );
  }
}
