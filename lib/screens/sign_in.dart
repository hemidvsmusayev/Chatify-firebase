import 'package:chat_app/wigdets/gradient_button.dart';
import 'package:chat_app/wigdets/input_decoration.dart';
import 'package:chat_app/wigdets/text_style.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              TextField(
                  style: simpleTextStyle(),
                  decoration: buildInputDecoration("Email")),
              SizedBox(
                height: 12,
              ),
              TextField(
                  style: simpleTextStyle(),
                  decoration: buildInputDecoration("Password")),
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
                onTap: () {},
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
                  Text(
                    "Register now",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
