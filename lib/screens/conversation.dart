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

  Stream messagesStrem;

  @override
  void initState() {
    databaseMethods.getMessages(widget.chatRoomId).then((value) {
      setState(() {
        messagesStrem = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatify"),
      ),
      body: Container(
        child: Stack(
          children: [chatMessageList(), buildMessageInput()],
        ),
      ),
    );
  }

  buildMessageInput() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
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
                        hintText: "Type here...",
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
    return StreamBuilder(
      stream: messagesStrem,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            return MessageTile(
                snapshot.data.documents[index].data["message"]);
          },
        )
            : Container();
      },
    );
  }

  sendMessage() {
    if (messageTxt.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageTxt.text,
        "sendBy": Constants.myName,
        "time": DateTime
            .now()
            .millisecondsSinceEpoch
      };
      databaseMethods.sendMessages(widget.chatRoomId, messageMap);
      messageTxt.text = "";
    }
  }
}

class MessageTile extends StatelessWidget {
  final String message;

  MessageTile(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message, style: simpleTextStyle()),
    );
  }
}
