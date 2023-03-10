part of 'transaction_month_bloc.dart';

@immutable
abstract class TransactionMonthEvent {}
class ChangeMonthEvent extends TransactionMonthEvent {
  final String? month;
  ChangeMonthEvent({
     this.month,
  });
}
