import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/history/presentation/bloc/history_bloc.dart';
import 'package:terminal_project/src/statistics/presentation/widgets/statistics_card.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HistoryBloc>();
    return BlocProvider(
      create: (context) => HistoryBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'statistics'.tr(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSpacings.vert32,
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'last'.tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: ' 7',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'days'.tr(),
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacings.vert32,
                BlocBuilder<HistoryBloc, HistoryState>(
                  bloc: bloc,
                  builder: (c, state) {
                    if (state is HistoryLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is HistorySuccess) {
                      return GestureDetector(
                        onTap: () {
                          print(bloc.month);
                        },
                        child: StatisticsCard(
                          firstText: 'total_received'.tr(),
                          secondText: '${state.totalReceived.toString()}\$',
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                AppSpacings.vert16,
                StatisticsCard(
                  firstText: 'number_of_transactions'.tr(),
                  secondText: '${bloc.historyList.length}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
