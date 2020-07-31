import 'dart:ui';

import 'package:chat_app/services/database.dart';
import 'package:chat_app/wigdets/input_decoration.dart';
import 'package:chat_app/wigdets/search_button.dart';
import 'package:chat_app/wigdets/search_tile.dart';
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
      appBar: AppBar(
        title: Text("Chatify"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                        controller: searchTxt,
                        decoration: buildInputDecoration("search username..."),
                      )),
                  GestureDetector(
                      onTap: initiateSearch, child: buildSearchBtn()),
                ],
              ),
            )
          ],
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
        itemCount: searchSnapshot.documents.length,
        itemBuilder: (context, index) {
          return userTile(
              searchSnapshot.documents[index].data["name"],
              searchSnapshot.documents[index].data["email"]);
        })
        : Container();
  }

  Widget userTile(String userName, String userEmail) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
              Text(
                userEmail,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Text("Message",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
            ),
          )
        ],
      ),
    );
  }

  createChatRoom(String userName) {
    List<String> users = [userName,];
    databaseMethods.createChatRoom(chatRoomId, chatRoomMap)
  }


}
