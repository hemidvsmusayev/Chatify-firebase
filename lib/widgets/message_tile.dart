import 'package:chat_app/shared/app_colors.dart';
import 'package:chat_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;

  MessageTile(this.message, this.isSendByMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: isSendByMe ? 62 : 8, right: isSendByMe ? 8 : 62),
      margin: EdgeInsets.symmetric(vertical: 2),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: isSendByMe
                    ? [
                        AppColors.messageRightFirstColor,
                        AppColors.messageRightSecondColor
                      ]
                    : [
                        AppColors.messageLeftFirstColor,
                        AppColors.messageLeftSecondColor
                      ]),
            borderRadius: isSendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18))
                : BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
        child: Text(message,
            style: isSendByMe ? mediumTextStyle() : simpleTextStyle()),
      ),
    );
  }
}
