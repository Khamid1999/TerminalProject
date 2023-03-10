import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';

class AppStyles {
  AppStyles._();
  static const headerTextStyle = TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        fontFamily: "OpenSans",
      ),
      appBarTextStyle = TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
        color: AppColors.black,
        fontFamily: "OpenSans",
      ),
      mainBlackTextStyle = TextStyle(
        letterSpacing: 1,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        fontFamily: "OpenSans",
        shadows: [
          Shadow(
            blurRadius: 5.0,
            color: AppColors.black,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      mainWhiteTextStyle = TextStyle(
        fontSize: 26,
        color: AppColors.white,
        fontFamily: "OpenSans",
      ),
      textFieldHintStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.grey,
        fontFamily: "OpenSans",
      ),
      mainGreenTextStyle = TextStyle(
        fontSize: 24,
        color: AppColors.green,
        fontFamily: "OpenSans",
      ),
      actionButtonTextStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.dark,
        fontFamily: "OpenSans",
      ),
      historyTextStyle = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.dark,
        fontFamily: "OpenSans",
      ),
      settingsTitleStyle = TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontFamily: "OpenSans",
      ),
      localizationTextStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: "OpenSans",
      );
}
