import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class CurrencyTextField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  const CurrencyTextField({Key? key, required this.controller, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        controller:controller,
        keyboardType: TextInputType.number,
        cursorColor: AppColors.green,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(right: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: AppColors.green,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: AppColors.green,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: AppColors.green,
              width: 2,
            ),
          ),
        ),
        style: AppStyles.mainGreenTextStyle.copyWith(
          fontSize: 40,
        ),
      ),
    );
  }
}
