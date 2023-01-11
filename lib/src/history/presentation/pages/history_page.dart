import 'package:flutter/material.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "HistoryPage",
          style: AppStyles.actionButtonTextStyle,
        ),
      ),
    );
  }
}
