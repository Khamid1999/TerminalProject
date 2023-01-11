import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/root/presentation/bloc/root_page_cubit.dart';
import 'package:terminal_project/src/root/presentation/widgets/bottom_navigation_bar.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RootPageCubit, RootPageState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.index,
            children: state.screenList,
          );
        },
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
