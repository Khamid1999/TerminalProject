import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/root/presentation/bloc/root_page_bloc.dart';
import 'package:terminal_project/src/root/presentation/widgets/bottom_navigation_item.dart';
import 'package:terminal_project/src/theme/app_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onIndexChanged;

  CustomNavigationBar({
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<RootPageBloc, RootPageState>(
      builder: (context, state) {
        return Container(
          height: 87,
          width: size.width,
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavBarItem(
                icon: Icons.event_note_outlined,
                backgroundColor:
                    state.index == 0 ? AppColors.green : AppColors.white,
              ),
              NavBarItem(
                icon: Icons.home,
                backgroundColor:
                    state.index == 0 ? AppColors.green : AppColors.white,
              ),
              NavBarItem(
                icon: Icons.bar_chart,
                backgroundColor:
                    state.index == 0 ? AppColors.green : AppColors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
