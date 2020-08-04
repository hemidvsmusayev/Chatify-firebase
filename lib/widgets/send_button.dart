import 'package:chat_app/shared/app_colors.dart';
import 'package:flutter/material.dart';

Container buildSendBtn(String fileDirectory) {
  return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.sendButtonFirstColor,
                AppColors.sendButtonSecondColor
              ]),
          borderRadius: BorderRadius.circular(40)),
      child: Image.asset(
        fileDirectory,
        height: 20,
        width: 20,
      ));
}
