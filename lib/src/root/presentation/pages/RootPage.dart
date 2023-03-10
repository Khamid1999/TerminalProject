import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/history/presentation/bloc/history_bloc.dart';
import 'package:terminal_project/src/history/presentation/bloc/transaction_month_bloc.dart';
import 'package:terminal_project/src/history/presentation/pages/history_page.dart';
import 'package:terminal_project/src/home/presentation/pages/home_page.dart';
import 'package:terminal_project/src/root/presentation/bloc/root_page_cubit.dart';
import 'package:terminal_project/src/root/presentation/widgets/bottom_navigation_bar.dart';
import 'package:terminal_project/src/statistics/presentation/pages/StatisticsPage.dart';

class RootPage extends StatelessWidget {
  RootPage({Key? key}) : super(key: key);

  final List<Widget> screenList = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HistoryBloc(),
        ),
        BlocProvider(
          create: (context) => TransactionMonthBloc()
            ..add(
              ChangeMonthEvent(
                month: 'January',
              ),
            ),
        ),
      ],
      child: HistoryPage(),
    ),
    HomePage(),
    StatisticsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RootPageCubit, RootPageState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.index,
            children: screenList,
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
