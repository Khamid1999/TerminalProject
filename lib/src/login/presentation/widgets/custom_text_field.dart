import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final FormFieldValidator<String?> validator;
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final VoidCallback? suffixIconOnTap;
  final Function(String) onChanged;
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.obscureText,
    required this.controller,
    required this.textInputAction, required this.validator, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.textFieldHintStyle.copyWith(
        color: AppColors.black,
      ),
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: () {
                  suffixIconOnTap!();
                },
                child: suffixIcon,
              )
            : null,
        hintText: hintText,
        hintStyle: AppStyles.textFieldHintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      textInputAction: textInputAction,
    );
  }
}
