part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {
  final String? month;
  GetHistoryEvent({
    this.month,
  });
}
