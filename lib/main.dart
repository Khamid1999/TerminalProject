import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terminal_project/bluetooth_check_.dart';
import 'package:terminal_project/src/router/app_router.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_theme.dart';
import 'package:terminal_project/src/tools/shared_preferences_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


const localStorage = FlutterSecureStorage();



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
      theme: AppTheme().appTheme,
      title: 'Terminal Project',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
       onGenerateRoute: AppRouter.instance.onGenerateRoute,
      initialRoute: AppRoutes.loginPage,
      //initialRoute: hasLocale ? AppRoutes.rootPage : AppRoutes.languageChoosePage,
    );
  }
}
