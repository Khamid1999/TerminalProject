import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/history/presentation/pages/history_page.dart';
import 'package:terminal_project/src/home/presentation/pages/home_page.dart';
import 'package:terminal_project/src/root/presentation/bloc/root_page_bloc.dart';
import 'package:terminal_project/src/root/presentation/widgets/bottom_navigation_bar.dart';
import 'package:terminal_project/src/statistics/presentation/pages/StatisticsPage.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RootPageBloc, RootPageState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.index,
            children: [
              HistoryPage(),
              HomePage(),
              StatisticsPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        onIndexChanged: (int value) {
          context.read<RootPageBloc>().add(
                RootPageIndexChangedEvent(
                  index: value,
                ),
              );
        },
      ),
    );
  }
}
