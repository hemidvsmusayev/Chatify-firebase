import 'package:chat_app/wigdets/text_style.dart';
import 'package:flutter/material.dart';

Widget buildSearchTile(String title, String email) {
  return ListTile(
    title: Text(title, style: simpleTextStyle()),
    subtitle: Text(email, style: simpleTextStyle()),
    trailing: IconButton(icon: Icon(Icons.message), onPressed: () {}),
  );
}
