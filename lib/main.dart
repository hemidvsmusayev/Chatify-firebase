import 'package:chat_app/helper/authenticate.dart';
import 'package:chat_app/helper/helper_functions.dart';
import 'package:chat_app/screens/chat_room.dart';
import 'package:chat_app/shared/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedKeyPref().then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.gradientButtonFirstColor,
        fontFamily: "FiraSans",
        scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isLoggedIn != null
          ? isLoggedIn ? ChatRoom() : Authenticate()
          : Authenticate(),
    );
  }
}
