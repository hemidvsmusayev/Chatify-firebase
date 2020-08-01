import 'package:chat_app/helper/authenticate.dart';
import 'package:chat_app/helper/contstants.dart';
import 'package:chat_app/helper/helper_functions.dart';
import 'package:chat_app/screens/search.dart';
import 'package:chat_app/services/authentication.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMetods = new AuthMethods();

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatify"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              authMetods.signOut();
              HelperFunctions.saveUserLoggedKeyPref(false);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app),
            ),
          )
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
    setState(() {});
  }
}
