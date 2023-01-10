import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  NavBarItem({required this.icon, required this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 30,
      child: Center(
        child: Icon(
          icon,
          color: AppColors.black,
          size: 25,
        ),
      ),
    );
  }
}
