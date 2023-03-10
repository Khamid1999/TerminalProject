import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/history/data/models/history_model.dart';
import 'package:terminal_project/src/history/domain/services/history_service.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryService historyService = HistoryService();
  History successHistory = History();
  List<HistoryModel> historyList = [];
  String? month;

  double getTotalReceived() {
    double totalReceived = 0.0;
    historyList.forEach(
      (element) {
        totalReceived += double.parse(element.valueTranz!).toDouble();
      },
    );
    return totalReceived;
  }

  HistoryBloc() : super(HistoryInitial()) {
    on<GetHistoryEvent>(
      (event, emit) async {
        emit(
          HistoryLoading(),
        );
        await historyService.getHistory().then(
          (value) {
            value.fold(
              (l) => emit(
                HistoryError(
                  error: l.message.toString(),
                ),
              ),
              (r) {
                successHistory = r;
                month = event.month;
                historyList = successHistory.history!
                    .where(
                      (element) =>
                          element.userId!.contains("1810144") &&
                          element.paymentMonth!.contains(event.month!),
                    )
                    .toList();
                if (historyList.isEmpty) {
                  emit(
                    HistoryError(
                      error: "No transactions for this month",
                    ),
                  );
                } else
                  emit(
                    HistorySuccess(
                      historyList: historyList,
                      historyModel: successHistory,
                      totalReceived: getTotalReceived(),
                    ),
                  );
              },
            );
          },
        );
      },
    );
  }
}
