import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/language_choose/presentation/widgets/custom_button.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';
import 'package:terminal_project/src/third_step/presentation/bloc/third_step_bloc.dart';
import 'package:terminal_project/src/third_step/presentation/widgets/currency_text_field.dart';

class ThirdStepPage extends StatelessWidget {
  const ThirdStepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final bloc = BlocProvider.of<ThirdStepBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'create_a_payment_without_mark'.tr(),
        ),
      ),
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
              AppSpacings.vert20,
              Center(
                child: Text(
                  'step_three'.tr(),
                  style: AppStyles.textFieldHintStyle.copyWith(fontSize: 20),
                ),
              ),
              AppSpacings.vert16,
              Text(
                "check_order".tr(),
                textAlign: TextAlign.center,
                style: AppStyles.mainBlackTextStyle.copyWith(
                  fontSize: 45,
                ),
              ),
              AppSpacings.vert48,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'order_amount_small'.tr() + " \$:",
                  style: AppStyles.textFieldHintStyle.copyWith(
                    color: AppColors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              AppSpacings.vert20,
              CurrencyTextField(
                controller: bloc.moneyAmountController,
                width: size.width,
                height: 60,
              ),
              AppSpacings.vert20,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ethereum (ETH) amount:",
                  style: AppStyles.textFieldHintStyle.copyWith(
                    color: AppColors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              AppSpacings.vert20,
              CurrencyTextField(
                controller: bloc.cryptoAmountController,
                width: size.width,
                height: 60,
              ),
              AppSpacings.vert40,
              isKeyboard
                  ? Container(
                      height: 0,
                    )
                  : Container(
                      height: 60,
                      child: CustomButton.text(
                        labelStyle: AppStyles.mainWhiteTextStyle.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        backgroundColor: AppColors.green,
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.qrCodeScannerPage);
                        },
                        height: 60,
                        label: 'generate_qr'.tr(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
