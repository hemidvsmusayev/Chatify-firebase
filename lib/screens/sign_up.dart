import 'package:chat_app/wigdets/gradient_button.dart';
import 'package:chat_app/wigdets/input_decoration.dart';
import 'package:chat_app/wigdets/text_style.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

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
                  child: Text("Sign up", style: largeTextStyle())),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: txtName,
                        style: simpleTextStyle(),
                        decoration: buildInputDecoration("Username")),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                        controller: txtEmail,
                        style: simpleTextStyle(),
                        decoration: buildInputDecoration("Email")),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
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
                  onTap: () {

                  }, child: buildGradientBtn(context, "Sign Up")),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {},
                child: buildWhiteGradientBtn(context, "Sign up with Google"),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have account? ", style: simpleTextStyle()),
                  Text(
                    "Sign in now",
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
