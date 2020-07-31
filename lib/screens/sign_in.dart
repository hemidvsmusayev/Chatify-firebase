import 'package:chat_app/helper/helper_functions.dart';
import 'package:chat_app/screens/chat_room.dart';
import 'package:chat_app/services/authentication.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/wigdets/gradient_button.dart';
import 'package:chat_app/wigdets/input_decoration.dart';
import 'package:chat_app/wigdets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
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
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Please Enter Correct Email";
                              },
                              controller: txtEmail,
                              style: simpleTextStyle(),
                              decoration: buildInputDecoration("Email")),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Enter Password 6+ characters";
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      alignment: Alignment.centerRight,
                      child: Text("Forgot password", style: simpleTextStyle()),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        signMeIn();
                      },
                      child: buildGradientBtn(context, "Sign in"),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child:
                          buildWhiteGradientBtn(context, "Sign in with Google"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? ",
                            style: simpleTextStyle()),
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

  signMeIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authMethods
          .signInWithEmailAndPassword(txtEmail.text, txtPassword.text)
          .then((result) async {
        if (result != null) {
          QuerySnapshot userInfoSnapshot =
              await DatabaseMethods().getUserInfo(txtEmail.text);

          HelperFunctions.saveUserLoggedKeyPref(true);
          HelperFunctions.saveUserNameKeyPref(
              userInfoSnapshot.documents[0].data["name"]);
          HelperFunctions.saveUserEmailKeyPref(
              userInfoSnapshot.documents[0].data["email"]);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}
