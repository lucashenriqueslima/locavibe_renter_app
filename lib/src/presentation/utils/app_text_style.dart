import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle normal({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      GoogleFonts.beVietnamPro(
        textStyle: TextStyle(
          color: color ?? AppColors.primaryText,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      );

  static TextStyle bold({
    double? fontSize,
    Color? color,
  }) =>
      GoogleFonts.beVietnamPro(
        textStyle: TextStyle(
          color: color ?? AppColors.primaryText,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.bold,
        ),
      );

  // static TextStyle get title => const TextStyle(
  //       fontSize: 24,
  //       fontWeight: FontWeight.bold,
  //     );

  // static const TextStyle subtitle = TextStyle(
  //   fontSize: 20,
  //   fontWeight: FontWeight.bold,
  // );

  // static TextStyle body = GoogleFonts.beVietnamPro(
  //   textStyle: const TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.normal,
  //   ),
  // );
}
