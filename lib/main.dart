import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terminal_project/src/language_choose/presentation/pages/language_choose_page.dart';
import 'package:terminal_project/src/router/app_router.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/tools/shared_preferences_keys.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final sp = await SharedPreferences.getInstance();
  final langCode = sp.getString(SharedPreferencesKeys.locale);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      startLocale: langCode != null ? Locale(langCode) : Locale('en'),
      saveLocale: true,
      path: 'assets/translations',
      useFallbackTranslations: true,
      child: TerminalApp(
        hasLocale: sp.containsKey(SharedPreferencesKeys.locale),
      ),
    ),
  );
}

class TerminalApp extends StatelessWidget {
  final bool hasLocale;
  const TerminalApp({
    Key? key,
    this.hasLocale = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.green,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.black,
          ),
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        scaffoldBackgroundColor: AppColors.white,
      ),
      title: 'Terminal Project',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: LanguageChoosePage(),
      // onGenerateRoute: AppRouter.instance.onGenerateRoute,
      // initialRoute:
      //     hasLocale ? AppRoutes.authWrapper : AppRoutes.languageChoosePage,
    );
  }
}
