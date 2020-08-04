import 'package:chat_app/shared/app_colors.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintTxt, Icon iconData) {
  return InputDecoration(
    prefixIcon: iconData,
    labelText: hintTxt,
    labelStyle: TextStyle(color: AppColors.inputLineHintColor),
    focusedBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(width: 1.5, color: AppColors.inputLineFocusedColor)),
    enabledBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(width: 1.5, color: AppColors.inputLineEnabledColor)),
    errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: Colors.red)),
    focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: Colors.red)),
  );
}