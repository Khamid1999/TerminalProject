import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/root/presentation/bloc/root_page_cubit.dart';
import 'package:terminal_project/src/root/presentation/widgets/bottom_navigation_item.dart';
import 'package:terminal_project/src/theme/app_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<RootPageCubit, RootPageState>(
      builder: (context, state) {
        return Container(
          height: 87,
          width: size.width,
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<RootPageCubit>().changeNavBarIndex(0);
                },
                child: NavBarItemWidget(
                  icon: Icons.event_note_outlined,
                  backgroundColor:
                      state.index == 0 ? AppColors.lightGreen : AppColors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<RootPageCubit>().changeNavBarIndex(1);
                },
                child: NavBarItemWidget(
                  icon: Icons.home_outlined,
                  backgroundColor:
                      state.index == 1 ? AppColors.lightGreen : AppColors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<RootPageCubit>().changeNavBarIndex(2);
                },
                child: NavBarItemWidget(
                  icon: Icons.bar_chart,
                  backgroundColor:
                      state.index == 2 ? AppColors.lightGreen : AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
