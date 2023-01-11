import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class AppTheme{
  ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      titleTextStyle: AppStyles.appBarTextStyle,
      iconTheme: IconThemeData(
        color: AppColors.green,
        size: 30,
      ),
    ),
  );
}