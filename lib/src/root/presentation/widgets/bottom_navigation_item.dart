import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';

class NavBarItemWidget extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  NavBarItemWidget({
    required this.icon,
    required this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 30,
      child: Center(
        child: Icon(
          icon,
          color: AppColors.black,
          size: 27,
        ),
      ),
    );
  }
}
