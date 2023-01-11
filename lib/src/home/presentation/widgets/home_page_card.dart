import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

import '../../../theme/app_colors.dart';

class HomePageCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  HomePageCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 10.0, left: 24),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            color: AppColors.lightGreen,
            width: 4,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppStyles.mainWhiteTextStyle.copyWith(
                fontSize: 38,
                color: AppColors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            Icon(
              icon,
              color: AppColors.black,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
