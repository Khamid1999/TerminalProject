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
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        fontFamily: "OpenSans",
      ),
      mainBlackTextStyle = TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        fontFamily: "OpenSans",
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: AppColors.black,
            offset: Offset(5.0, 5.0),
          ),
        ],
      ),
      mainWhiteTextStyle = TextStyle(
        fontSize: 26,
        color: AppColors.white,
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
      localizationTextStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        fontFamily: "OpenSans",
      );
}
