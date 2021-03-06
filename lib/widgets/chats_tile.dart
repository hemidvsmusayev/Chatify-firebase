import 'package:chat_app/screens/conversation.dart';
import 'package:chat_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

class ChatsTile extends StatelessWidget {
  final String userName;
  final String chatRoom;

  ChatsTile(this.userName, this.chatRoom);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(chatRoom)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40)),
                child: Text("${userName.substring(0, 1).toUpperCase()}",
                    style: mediumTextStyle())),
            SizedBox(width: 8),
            Text(userName, style: simpleTextStyle())
          ],
        ),
      ),
    );
  }
}
