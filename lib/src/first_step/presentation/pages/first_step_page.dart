import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/first_step/presentation/bloc/first_step_bloc.dart';
import 'package:terminal_project/src/language_choose/presentation/widgets/custom_button.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class FirstStepPage extends StatelessWidget {
  const FirstStepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FirstStepBloc>();
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'create_a_payment_without_mark'.tr(),
        ),
      ),
      body: BlocBuilder<FirstStepBloc, FirstStepState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'step_one'.tr(),
                    style: AppStyles.textFieldHintStyle.copyWith(fontSize: 25),
                  ),
                  AppSpacings.vert16,
                  Text(
                    "order_amount".tr(),
                    style: AppStyles.mainBlackTextStyle.copyWith(
                      fontSize: 45,
                    ),
                  ),
                  AppSpacings.vert16,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 60,
                        width: 210,
                        child: TextFormField(
                          controller: bloc.numberController,
                          keyboardType: TextInputType.number,
                          cursorColor: AppColors.green,
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: AppColors.green,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: AppColors.green,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: AppColors.green,
                                width: 2,
                              ),
                            ),
                          ),
                          style: AppStyles.mainGreenTextStyle.copyWith(
                            fontSize: 40,
                          ),
                        ),
                      ),
                      AppSpacings.hor24,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "usd".tr(),
                          style: AppStyles.mainWhiteTextStyle.copyWith(
                            fontSize: 45,
                            color: AppColors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSpacings.vert40,
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: isKeyboard
          ? Container(
              height: 0,
            )
          : Container(
              height: 60,
              margin: EdgeInsets.only(bottom: 60,left: 20,right: 20),
              child: CustomButton.text(
                labelStyle: AppStyles.mainWhiteTextStyle.copyWith(
                  fontSize: 25,
                ),
                backgroundColor: AppColors.green,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.secondStepPage);
                },
                height: 60,
                label: 'next_step'.tr(),
              ),
            ),
    );
  }
}
