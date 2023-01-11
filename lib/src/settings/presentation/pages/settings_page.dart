import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pizzeria Bali #1',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50,
        ),
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: Column(
            children: [
              AppSpacings.vert48,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "language".tr(),
                    style: AppStyles.settingsTitleStyle,
                  ),
                  Text(
                    "english".tr(),
                    style: AppStyles.settingsTitleStyle.copyWith(
                      color: AppColors.lightGreen,
                    ),
                  ),
                ],
              ),
              AppSpacings.vert20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "main_currency".tr(),
                    style: AppStyles.settingsTitleStyle,
                  ),
                  Text(
                    "usd".tr(),
                    style: AppStyles.settingsTitleStyle.copyWith(
                      color: AppColors.lightGreen,
                    ),
                  ),
                ],
              ),
              AppSpacings.vert20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "withdrawals_to".tr(),
                    style: AppStyles.settingsTitleStyle,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.lightGreen,
                    size: 30,
                  ),
                ],
              ),
              AppSpacings.vert20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "help_center".tr(),
                    style: AppStyles.settingsTitleStyle,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.lightGreen,
                    size: 30,
                  ),
                ],
              ),
              AppSpacings.vert20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'log_out'.tr(),
                  style: AppStyles.settingsTitleStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
