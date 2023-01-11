import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class CryptoCard extends StatelessWidget {
  final double width;
  final String label;
  final VoidCallback onSelect;
  final String? avatarUrl;
  final bool selected;

  const CryptoCard({
    Key? key,
    required this.label,
    required this.onSelect,
    required this.width,
    this.avatarUrl,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: width,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.green : AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.green,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (avatarUrl != null)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    avatarUrl!,
                    width: 25,
                    height: 25,
                  ),
                ),
              Text(
                label,
                style: AppStyles.appBarTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
