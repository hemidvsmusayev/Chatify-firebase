import 'package:chat_app/wigdets/input_decoration.dart';
import 'package:chat_app/wigdets/search_button.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatify"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            buildSearchField(),
          ],
        ),
      ),
    );
  }

  buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: searchTxt,
            decoration: buildInputDecoration("search username..."),
          )),
          GestureDetector(onTap: () {}, child: buildSearchBtn()),
        ],
      ),
    );
  }
}
