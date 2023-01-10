import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final TextStyle? labelStyle;
  final Widget? child;

  CustomButton._({
    this.height,
    this.width,
    this.backgroundColor,
    required this.onTap,
    required this.label,
    this.labelStyle,
    this.child,
  });

  factory CustomButton.child({
    double? height,
    double? width,
    Color? backgroundColor,
    required VoidCallback onTap,
    required Widget child,
  }) =>
      CustomButton._(
        onTap: onTap,
        label: '',
        child: child,
        backgroundColor: backgroundColor,
        height: height,
        width: width,
      );

  factory CustomButton.text({
    required VoidCallback onTap,
    required String label,
    TextStyle? labelStyle,
    double? height,
    double? width,
    Color? backgroundColor,
  }) =>
      CustomButton._(
        onTap: onTap,
        label: label,
        height: height,
        width: width,
        backgroundColor: backgroundColor,
        labelStyle: labelStyle,
      );

  @override
  Widget build(BuildContext context) {
    final content = child == null ? Text(label, style: labelStyle) : child;
    return Material(
      color: backgroundColor,
      elevation: 0,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: content),
        ),
      ),
    );
  }
}
