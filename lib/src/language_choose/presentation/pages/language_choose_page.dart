import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terminal_project/src/language_choose/presentation/widgets/custom_button.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';
import 'package:terminal_project/src/tools/shared_preferences_keys.dart';

class LanguageChoosePage extends StatelessWidget {
  const LanguageChoosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                AppColors.black.withOpacity(0.4),
                AppColors.white,
                AppColors.black.withOpacity(0.4),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/crypto_logo.png',
                width: size.width,
                height: size.height * 0.3,
                fit: BoxFit.fitWidth,
              ),
              AppSpacings.vert40,
              AppSpacings.vert40,
              Text(
                "choose_language".tr(),
                style: AppStyles.headerTextStyle,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 0.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                    padding: EdgeInsets.all(2),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                EasyLocalization.of(context)?.setLocale(
                              const Locale('en'),
                            ),
                            icon: Image.asset(
                              'assets/images/united_states_flag.png',
                              height: 30,
                            ),
                            label: Text(
                              "English",
                              style: AppStyles.localizationTextStyle
                                  .copyWith(fontSize: 14),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                context.locale.languageCode == 'en'
                                    ? AppColors.black.withOpacity(0.7)
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                EasyLocalization.of(context)?.setLocale(
                              const Locale('ru'),
                            ),
                            icon: Image.asset(
                              'assets/images/russian_flag.png',
                              height: 30,
                            ),
                            label: Text(
                              "Русский",
                              style: AppStyles.localizationTextStyle
                                  .copyWith(fontSize: 14),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                context.locale.languageCode == 'ru'
                                    ? AppColors.black.withOpacity(0.7)
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppSpacings.vert24,
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton.text(
                    height: 46,
                    backgroundColor: AppColors.black.withOpacity(0.5),
                    onTap: () async {
                      final sp = await SharedPreferences.getInstance();
                      sp.setString(
                        SharedPreferencesKeys.locale,
                        context.locale.languageCode,
                      );
                      Navigator.pushNamed(context, AppRoutes.loginPage);
                    },
                    label: "continue".tr(),
                    labelStyle: AppStyles.actionButtonTextStyle.copyWith(
                      fontSize: 15,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              AppSpacings.vert32,
            ],
          ),
        ),
      ),
    );
  }
}
