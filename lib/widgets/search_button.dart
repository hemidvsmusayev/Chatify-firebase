import 'package:flutter/material.dart';

Container buildSearchBtn(String fileDirectory) {
  return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white38, borderRadius: BorderRadius.circular(40)),
      child: Image.asset(
        fileDirectory,
        height: 20,
        width: 20,
      ));
}
