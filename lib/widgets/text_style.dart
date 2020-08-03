import 'package:chat_app/shared/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle simpleTextStyle() {
  return TextStyle(color: AppColors.inputLineHintColor, fontSize: 17);
}

TextStyle mediumTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 18);
}

TextStyle largeTextStyle() {
  return TextStyle(
      color: AppColors.inputLineHintColor,
      fontSize: 40,
      fontWeight: FontWeight.bold);
}

TextStyle blueTextStyle() {
  return TextStyle(color: AppColors.gradientButtonFirstColor, fontSize: 17);
}

TextStyle appBarTextStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold);
}