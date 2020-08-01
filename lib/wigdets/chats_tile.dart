import 'package:chat_app/wigdets/text_style.dart';
import 'package:flutter/material.dart';

class ChatsTile extends StatelessWidget {
  final String userName;

  ChatsTile(this.userName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(40)),
              child: Text("${userName.substring(0, 1).toUpperCase()}")),
          SizedBox(width: 8),
          Text(userName, style: simpleTextStyle())
        ],
      ),
    );
  }
}
