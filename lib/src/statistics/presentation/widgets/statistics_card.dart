import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class StatisticsCard extends StatelessWidget {
  final String firstText;
  final String secondText;
  const StatisticsCard({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: AppColors.green,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                firstText,
                style: AppStyles.mainWhiteTextStyle.copyWith(
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
                maxLines: 2,
              ),
            ),
            AppSpacings.vert12,
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                secondText,
                style: AppStyles.mainWhiteTextStyle.copyWith(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: AppColors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
