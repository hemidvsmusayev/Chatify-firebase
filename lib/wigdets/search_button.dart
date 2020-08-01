import 'package:flutter/material.dart';

Container buildSearchBtn(String fileDirectory) {
  return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)]),
          borderRadius: BorderRadius.circular(40)),
      child: Image.asset(
        fileDirectory,
        height: 20,
        width: 20,
      ));
}
