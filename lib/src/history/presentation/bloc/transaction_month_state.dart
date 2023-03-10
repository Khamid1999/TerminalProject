part of 'transaction_month_bloc.dart';

@immutable
abstract class TransactionMonthState {}

class TransactionMonthInitial extends TransactionMonthState {}
class MonthChanged extends TransactionMonthState {
  final String month;
  MonthChanged({
    required this.month,
  });
}
