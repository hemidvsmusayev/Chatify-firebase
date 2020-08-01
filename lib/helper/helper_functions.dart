import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedKeyPref = "ISLOGGEDIN";
  static String userNameKeyPref = "USERNAMEKEY";
  static String userEmailKeyPref = "USEREMAILKEY";

  static Future<bool> saveUserLoggedKeyPref(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(userLoggedKeyPref, isLoggedIn);
  }

  static Future<bool> saveUserNameKeyPref(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userNameKeyPref, userName);
  }

  static Future<bool> saveUserEmailKeyPref(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmailKeyPref, userEmail);
  }

  static Future<bool> getUserLoggedKeyPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedKeyPref);
  }

  static Future<String> getUserNameKeyPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKeyPref);
  }

  static Future<String> getUserEmailKeyPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKeyPref);
  }
}
