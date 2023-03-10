import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/language_choose/presentation/widgets/custom_button.dart';
import 'package:terminal_project/src/qr_code/presentation/bloc/qr_code_bloc.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class QrCodeScannerPage extends StatelessWidget {
  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'create_a_payment_without_mark'.tr(),
        ),
      ),
      body: BlocConsumer<QrCodeBloc, QrCodeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppSpacings.vert32,
                    Center(
                      child: Text(
                        "scan_qr_code".tr(),
                        style: AppStyles.mainBlackTextStyle.copyWith(
                          fontSize: 30,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AppSpacings.vert32,
                    Center(
                      child: Icon(
                        Icons.qr_code_2_outlined,
                        size: size.width * 0.85,
                      ),
                    ),
                    AppSpacings.vert32,
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
                                  context,
                                  AppRoutes.paymentSuccessPage,
                                );
                              },
                              height: 60,
                              label: 'check_payment'.tr(),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
