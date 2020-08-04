import 'package:chat_app/helper/contstants.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/widgets/message_input_decoration.dart';
import 'package:chat_app/widgets/message_tile.dart';
import 'package:chat_app/widgets/send_button.dart';
import 'package:chat_app/widgets/text_style.dart';
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

  Stream messagesStream;

  @override
  void initState() {
    databaseMethods.getMessages(widget.chatRoomId).then((value) {
      setState(() {
        messagesStream = value;
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: chatMessageList(),
          ),
          buildMessageInput()
        ],
      ),
    );
  }

  buildMessageInput() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        color: Color(0x54FFFFFF),
        child: Row(
          children: [
            Expanded(
                child: TextField(
                    controller: messageTxt,
                    style: simpleTextStyle(),
                    decoration: buildMessageInputDecoration("Type here..."))),
            SizedBox(width: 16),
            GestureDetector(
                onTap: () {
                  sendMessage();
                },
                child: buildSendBtn("assets/images/send.png"))
          ],
        ),
      ),
    );
  }

  Widget chatMessageList() {
    return StreamBuilder(
      stream: messagesStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      snapshot.data.documents[index].data["message"],
                      snapshot.data.documents[index].data["sendBy"] ==
                          Constants.myName);
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
        "time": DateTime.now().millisecondsSinceEpoch
      };
      databaseMethods.sendMessages(widget.chatRoomId, messageMap);
      messageTxt.text = "";
    }
  }
}
