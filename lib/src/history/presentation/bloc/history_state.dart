part of 'history_bloc.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final double totalReceived;
  final History historyModel;
  final List<HistoryModel> historyList;
  HistorySuccess({
    required this.historyList,
    required this.historyModel,
    required this.totalReceived,
  });
}

class HistoryError extends HistoryState {
  final String error;
  HistoryError({
    required this.error,
  });
}
