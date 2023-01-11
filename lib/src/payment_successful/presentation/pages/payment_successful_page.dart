import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:terminal_project/src/language_choose/presentation/widgets/custom_button.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSpacings.vert32,
              Center(
                child: Text(
                  "payment_successful".tr(),
                  style: AppStyles.mainBlackTextStyle.copyWith(fontSize: 40),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
              AppSpacings.vert32,
              Center(
                child: Icon(
                  Icons.check_circle_outline_sharp,
                  size: size.width * 0.85,
                  color: AppColors.green,
                ),
              ),
              AppSpacings.vert32,
              Card(
                color: AppColors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                        height: 60,
                        child: CustomButton.text(
                          labelStyle: AppStyles.mainWhiteTextStyle.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                          backgroundColor: AppColors.green,
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.rootPage);
                          },
                          label: "back_to_menu".tr(),
                        ),
                      ),
              ),
              AppSpacings.vert12,
              Card(
                color: AppColors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.green,
                      width: 3
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 60,
                  child: CustomButton.text(
                    labelStyle: AppStyles.mainWhiteTextStyle.copyWith(
                      color: AppColors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    backgroundColor: AppColors.white,
                    onTap: () {
                    },
                    label: "print_receipt".tr(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
