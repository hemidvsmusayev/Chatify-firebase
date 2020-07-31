import 'package:flutter/material.dart';

Container buildSearchBtn() {
  return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)]),
          borderRadius: BorderRadius.circular(40)),
      child: Image.asset(
        "assets/images/search_white.png",
        height: 20,
        width: 20,
      ));
}
