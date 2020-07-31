import 'package:chat_app/helper/helper_functions.dart';
import 'package:chat_app/services/authentication.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/services/validators.dart';
import 'package:chat_app/wigdets/gradient_button.dart';
import 'package:chat_app/wigdets/input_decoration.dart';
import 'package:chat_app/wigdets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chat_room.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  AuthMethods authMethods = AuthMethods();
  DatabaseMethods databaseMethods = DatabaseMethods();
  QuerySnapshot snapshotUserInfo;

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 40,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Sign in", style: largeTextStyle())),
              SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        validator: (val) {
                          return Validator().validateEmail(val);
                        },
                        controller: txtEmail,
                        style: simpleTextStyle(),
                        decoration: buildInputDecoration("Email")),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                        validator: (val) {
                          return Validator().validatePassword(val);
                        },
                        controller: txtPassword,
                        style: simpleTextStyle(),
                        decoration: buildInputDecoration("Password")),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.centerRight,
                child: Text("Forgot password", style: simpleTextStyle()),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: signIn(),
                child: buildGradientBtn(context, "Sign in"),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {},
                child: buildWhiteGradientBtn(context, "Sign in with Google"),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account? ", style: simpleTextStyle()),
                  GestureDetector(
                    onTap: () {
                      widget.toggle();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Register now",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  signIn() {
    if (formKey.currentState.validate()) {
      HelperFunctions.saveUserEmailKeyPref(txtEmail.text);

      setState(() {
        isLoading = true;
      });

      databaseMethods.getUserByUserEmail(txtEmail.text).then((val) {
        snapshotUserInfo = val;
        HelperFunctions.saveUserEmailKeyPref(
            snapshotUserInfo.documents[0].data["name"]);
      });

      authMethods
          .signInWithEmailAndPassword(txtEmail.text, txtPassword.text)
          .then((val) {
        if (val != null) {
          HelperFunctions.saveUserLoggedKeyPref(true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        }
      });
    }
  }
}
