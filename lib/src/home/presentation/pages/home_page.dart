import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/home/presentation/widgets/home_page_card.dart';
import 'package:terminal_project/src/root/presentation/bloc/root_page_cubit.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AppSpacings.vert32,
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 8,
                  ),
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.lightGreen,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Pizzeria Bali #1',
                        style: AppStyles.textFieldHintStyle,
                      ),
                      AppSpacings.hor8,
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.settingsPage,
                          );
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacings.vert32,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.firstStepPage,
                  );
                },
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 210,
                            child: Text(
                              'create_a_payment'.tr(),
                              style: AppStyles.mainWhiteTextStyle.copyWith(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        AppSpacings.vert12,
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.featured_play_list_outlined,
                            color: AppColors.dark,
                            size: 90,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppSpacings.vert16,
              HomePageCard(
                onTap: () {
                  context.read<RootPageCubit>().changeNavBarIndex(0);
                },
                text: 'history'.tr(),
                icon: Icons.event_note_outlined,
              ),
              AppSpacings.vert8,
              HomePageCard(
                onTap: () {
                  context.read<RootPageCubit>().changeNavBarIndex(2);
                },
                text: 'statistics'.tr(),
                icon: Icons.bar_chart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
