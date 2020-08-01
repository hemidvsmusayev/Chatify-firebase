import 'package:chat_app/helper/contstants.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/wigdets/search_button.dart';
import 'package:chat_app/wigdets/text_style.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;

  ConversationScreen(this.chatRoomId);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  TextEditingController messageTxt = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatify"),
      ),
      body: Container(
        child: Stack(
          children: [
            //chatMessages(),
            buildMessageInput(),
          ],
        ),
      ),
    );
  }

  buildMessageInput() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        color: Color(0x54FFFFFF),
        child: Row(
          children: [
            Expanded(
                child: TextField(
                    controller: messageTxt,
                    style: simpleTextStyle(),
                    decoration: InputDecoration(
                        hintText: "Message ...",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        border: InputBorder.none))),
            SizedBox(width: 16),
            GestureDetector(
                onTap: () {
                  sendMessage();
                },
                child: buildSearchBtn("assets/images/send.png"))
          ],
        ),
      ),
    );
  }

  Widget chatMessageList() {

  }

  sendMessage() {
    if (messageTxt.text.isNotEmpty) {
      Map<String, String> messageMap = {
        "message": messageTxt.text,
        "sendBy": Constants.myName
      };
      databaseMethods.getMessages(widget.chatRoomId, messageMap);
    }
  }
}
