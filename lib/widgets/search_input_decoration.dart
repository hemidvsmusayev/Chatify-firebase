import 'package:chat_app/shared/app_colors.dart';
import 'package:chat_app/widgets/search_button.dart';
import 'package:flutter/material.dart';

InputDecoration buildSearchInputDecoration(String hintTxt) {
  return InputDecoration(
    hintText: hintTxt,
    hintStyle: TextStyle(color: Colors.white70),
    focusedBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(width: 1.5, color: AppColors.kScaffoldBackgroundColor)),
    enabledBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(width: 1.5, color: AppColors.kScaffoldBackgroundColor)),
    errorBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(width: 1.5, color: AppColors.inputLineErrorColor)),
    focusedErrorBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(width: 1.5, color: AppColors.inputLineErrorColor)),
  );
}
