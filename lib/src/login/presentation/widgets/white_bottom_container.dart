import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';

class BottomWhiteContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const BottomWhiteContainer({required this.child,required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 42),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.containerShadowColor,
            offset: Offset(0, -4),
            blurRadius: 20,
          ),
        ],
      ),
      child: child,
    );
  }
}
