import 'package:chat_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

InputDecoration buildMessageInputDecoration(String hintText) {
  return InputDecoration(
      fillColor: Colors.grey[200],
      filled: true,
      hintText: hintText,
      hintStyle: simpleTextStyle(),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.transparent)));
}
