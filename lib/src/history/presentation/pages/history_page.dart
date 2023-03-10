import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/history/presentation/bloc/history_bloc.dart';
import 'package:terminal_project/src/history/presentation/bloc/transaction_month_bloc.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final historyBloc = context.watch<HistoryBloc>();
    final monthBloc = context.watch<TransactionMonthBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "history".tr(),
          style: AppStyles.appBarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.green,
            size: 35,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cloud_download_sharp,
              color: AppColors.green,
              size: 35,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<HistoryBloc>().add(
          //       GetHistoryEvent(month: monthBloc.chosenMonth),
          //     );
          print(historyBloc.month);
        },
        backgroundColor: AppColors.green,
        child: const Icon(
          Icons.refresh,
          color: AppColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            height: 30,
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<TransactionMonthBloc, TransactionMonthState>(
                  builder: (context, state) {
                    if (state is MonthChanged) {
                      return RichText(
                        text: TextSpan(
                          text: "received_in".tr(),
                          style: AppStyles.actionButtonTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                          children: [
                            TextSpan(
                              text: state.month,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showMenu(
                                    context: context,
                                    position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                    items: monthBloc.monthsList
                                        .map(
                                          (e) => PopupMenuItem(
                                            onTap: () {
                                              monthBloc.add(
                                                ChangeMonthEvent(
                                                  month: e,
                                                ),
                                              );
                                              historyBloc.add(
                                                GetHistoryEvent(
                                                  month: e,
                                                ),
                                              );
                                            },
                                            child: Text(e),
                                            value: e,
                                          ),
                                        )
                                        .toList(),
                                  );
                                },
                              style: AppStyles.actionButtonTextStyle.copyWith(
                                color: AppColors.green,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                BlocBuilder<HistoryBloc, HistoryState>(
                  bloc: historyBloc,
                  builder: (context, state) {
                    if (state is HistorySuccess) {
                      return Text(
                        "~" +
                            historyBloc.getTotalReceived().toString() +
                            "dollar".tr(),
                        style: AppStyles.appBarTextStyle.copyWith(
                          color: AppColors.green,
                        ),
                      );
                    }
                    if (state is HistoryError) {
                      return Text(
                        "~0" + "dollar".tr(),
                        style: AppStyles.appBarTextStyle.copyWith(
                          color: AppColors.green,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
          AppSpacings.vert20,
          BlocConsumer<HistoryBloc, HistoryState>(
            bloc: historyBloc,
            listener: (context, state) {
              if (state is HistoryError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.error,
                      style: AppStyles.appBarTextStyle,
                    ),
                    backgroundColor: AppColors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is HistoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HistoryError) {
                return Center(
                  child: Text(
                    state.error,
                    style: AppStyles.mainBlackTextStyle,
                  ),
                );
              } else if (state is HistorySuccess) {
                if (state.historyList.isEmpty) {
                  return Center(
                    child: Text(
                      "no_transactions".tr(),
                      style: AppStyles.mainBlackTextStyle,
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.historyList.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime =
                            DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                                .parse(state.historyList[index].dateTime!);
                        final inputDate = DateTime.parse(
                          dateTime.toString(),
                        );
                        final outputFormat = DateFormat(
                          'MM/dd/yyyy hh:mm',
                        );
                        final outPutMonthFormat = DateFormat(
                          'MMMM',
                        );
                        final outputDate = outputFormat.format(
                          inputDate,
                        );
                        final outputMonth = outPutMonthFormat.format(
                          inputDate,
                        );
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(
                                "payment_id".tr() +
                                    state.historyList[index].paymentId!,
                                style: AppStyles.historyTextStyle,
                              ),
                              subtitle: Text(
                                outputDate.toString(),
                                style: AppStyles.historyTextStyle,
                              ),
                              trailing: Text(
                                "~" + state.historyList[index].valueTranz!,
                                style: AppStyles.historyTextStyle,
                              ),
                              leading: Text(
                                state.historyList[index].paymentMonth!,
                                style: AppStyles.historyTextStyle,
                              ),
                            ),
                            const Divider(
                              indent: 15,
                              endIndent: 15,
                              height: 1,
                              thickness: 1,
                              color: AppColors.green,
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
