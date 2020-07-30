import 'package:chat_app/wigdets/app_bar.dart';
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
              SizedBox(height: 50,),
              TextField(
                  style: simpleTextStyle(),
                  decoration: buildInputDecoration("email")),
              SizedBox(height: 12,),
              TextField(
                  style: simpleTextStyle(),
                  decoration: buildInputDecoration("password")),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.centerRight,
                child: Text("Forgot password", style: simpleTextStyle()),
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                ),
                borderRadius: BorderRadius.circular(30)),
                child: Text("Sign in", style: simpleTextStyle()),
              ),
              SizedBox(height: 12,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xffffffff), Color(0xffefffff)],
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Text("Sign in with Google", style: mediumTextStyle()),
              ),
              SizedBox(height: 16,),
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
