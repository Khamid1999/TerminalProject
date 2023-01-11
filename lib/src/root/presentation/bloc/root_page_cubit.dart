import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:terminal_project/src/history/presentation/pages/history_page.dart';
import 'package:terminal_project/src/home/presentation/pages/home_page.dart';
import 'package:terminal_project/src/root/presentation/common/enum_navbar.dart';
import 'package:terminal_project/src/statistics/presentation/pages/StatisticsPage.dart';
part 'root_page_event.dart';
part 'root_page_state.dart';

class RootPageCubit extends Cubit<RootPageState> {
  RootPageCubit() : super(RootPageState(index: 0, navBarItem: NavBarItem.history));

  void changeNavBarIndex(index) {
    switch (index) {
      case 0:
        emit(RootPageState(index: index, navBarItem: NavBarItem.history));
        break;
      case 1:
        emit(RootPageState(index: index, navBarItem: NavBarItem.home));
        break;
      case 2:
        emit(RootPageState(index: index, navBarItem: NavBarItem.statistics));
        break;
    }
  }
}
