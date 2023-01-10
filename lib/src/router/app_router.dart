import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/first_step/presentation/bloc/first_step_bloc.dart';
import 'package:terminal_project/src/first_step/presentation/pages/first_step_page.dart';
import 'package:terminal_project/src/history/presentation/bloc/history_bloc.dart';
import 'package:terminal_project/src/history/presentation/pages/history_page.dart';
import 'package:terminal_project/src/home/presentation/bloc/home_page_bloc.dart';
import 'package:terminal_project/src/home/presentation/pages/home_page.dart';
import 'package:terminal_project/src/language_choose/presentation/bloc/language_choose_bloc.dart';
import 'package:terminal_project/src/language_choose/presentation/pages/language_choose_page.dart';
import 'package:terminal_project/src/login/presentation/bloc/login_bloc.dart';
import 'package:terminal_project/src/login/presentation/pages/login_page.dart';
import 'package:terminal_project/src/payment_failure/presentation/pages/payment_failure_page.dart';
import 'package:terminal_project/src/payment_successful/presentation/bloc/payment_successful_bloc.dart';
import 'package:terminal_project/src/payment_successful/presentation/pages/payment_successful_page.dart';
import 'package:terminal_project/src/qr_code/presentation/bloc/qr_code_bloc.dart';
import 'package:terminal_project/src/qr_code/presentation/pages/qr_code_scanner_page.dart';
import 'package:terminal_project/src/root/presentation/bloc/root_page_bloc.dart';
import 'package:terminal_project/src/root/presentation/pages/RootPage.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/second_step/presentation/bloc/second_step_bloc.dart';
import 'package:terminal_project/src/second_step/presentation/pages/second_step_page.dart';
import 'package:terminal_project/src/statistics/presentation/bloc/statistics_bloc.dart';
import 'package:terminal_project/src/statistics/presentation/pages/StatisticsPage.dart';
import 'package:terminal_project/src/third_step/presentation/bloc/third_step_bloc.dart';
import 'package:terminal_project/src/third_step/presentation/pages/third_step_page.dart';

import '../payment_failure/presentation/bloc/payment_failure_bloc.dart';

class AppRouter {
  AppRouter._();

  static AppRouter get instance => AppRouter._();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.languageChoosePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LanguageChooseBloc(),
            child: LanguageChoosePage(),
          ),
        );
      case AppRoutes.loginPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginPage(),
          ),
        );
      case AppRoutes.rootPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => RootPageBloc(),
              ),
              BlocProvider(
                create: (_) => HomePageBloc(),
              ),
              BlocProvider(
                create: (_) => StatisticsBloc(),
              ),
              BlocProvider(
                create: (_) => HistoryBloc(),
              ),
            ],
            child: RootPage(),
          ),
        );
      case AppRoutes.homePage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (_) => HomePageBloc(),
            child: HomePage(),
          ),
        );
      case AppRoutes.statisticsPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (_) => StatisticsBloc(),
            child: StatisticsPage(),
          ),
        );
      case AppRoutes.historyPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => HistoryBloc(),
            child: HistoryPage(),
          ),
        );
      case AppRoutes.firstStepPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => FirstStepBloc(),
            child: FirstStepPage(),
          ),
        );
      case AppRoutes.secondStepPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => SecondStepBloc(),
            child: SecondStepPage(),
          ),
        );
      case AppRoutes.thirdStepPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => ThirdStepBloc(),
            child: ThirdStepPage(),
          ),
        );
      case AppRoutes.qrCodeScannerPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => QrCodeBloc(),
            child: QrCodeScannerPage(),
          ),
        );
      case AppRoutes.paymentSuccessPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => PaymentSuccessfulBloc(),
            child: PaymentSuccessfulPage(),
          ),
        );
      case AppRoutes.paymentFailurePage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => PaymentFailureBloc(),
            child: PaymentFailurePage(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider(
            create: (context) => HomePageBloc(),
            child: HomePage(),
          ),
        );
    }
  }
}