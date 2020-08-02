import 'package:chat_app/shared/app_colors.dart';
import 'package:chat_app/widgets/text_style.dart';
import 'package:flutter/material.dart';

Container buildGradientBtn(BuildContext context, String btnText) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.gradientButtonFirstColor,
            AppColors.gradientButtonSecondColor
          ],
        ),
        borderRadius: BorderRadius.circular(30)),
    child: Text(btnText, style: mediumTextStyle()),
  );
}