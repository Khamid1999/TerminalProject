import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:terminal_project/src/statistics/presentation/widgets/statistics_card.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'statistics'.tr(),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppSpacings.vert32,
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'last'.tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: ' 7',
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'days'.tr(),
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacings.vert32,
              StatisticsCard(
                firstText: 'total_received'.tr(),
                secondText: '~3825,9\$',
              ),
              AppSpacings.vert16,
              StatisticsCard(
                firstText: 'number_of_transactions'.tr(),
                secondText: '27',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
