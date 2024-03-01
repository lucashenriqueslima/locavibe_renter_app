import 'package:flutter/material.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_colors.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final TextDecoration decoration;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.decoration = TextDecoration.none,
    this.color,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Text(
        label,
        style: AppTextStyle.normal().copyWith(
          decoration: decoration,
          decorationColor: color ?? AppColors.secondary,
          color: color ?? AppColors.secondary,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
