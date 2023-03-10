import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transaction_month_event.dart';
part 'transaction_month_state.dart';

class TransactionMonthBloc
    extends Bloc<TransactionMonthEvent, TransactionMonthState> {
  String chosenMonth = "January";
  List<String> monthsList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  TransactionMonthBloc() : super(TransactionMonthInitial()) {
    on<ChangeMonthEvent>(
      (event, emit) {
        chosenMonth = event.month!;
        emit(
          MonthChanged(
            month: event.month!,
          ),
        );
      },
    );
  }
}
