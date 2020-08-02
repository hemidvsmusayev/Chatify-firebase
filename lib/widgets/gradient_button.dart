import 'package:chat_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

Container buildGradientBtn(BuildContext context, String btnText) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
        ),
        borderRadius: BorderRadius.circular(30)),
    child: Text(btnText, style: simpleTextStyle()),
  );
}

Container buildWhiteGradientBtn(BuildContext context, String btnText) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffffffff), Color(0xffefffff)],
        ),
        borderRadius: BorderRadius.circular(30)),
    child: Text(btnText, style: mediumTextStyle()),
  );
}
