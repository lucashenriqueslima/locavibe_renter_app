import 'package:flutter/material.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_colors.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_text_style.dart';

class AppPrimaryButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? label;
  final Widget? contentWidget;
  final double? height;
  final double? width;
  final double? maxWidth;
  final Color? backgroundColorButton;
  final TextStyle? textStyle;
  final bool isLoading;

  const AppPrimaryButtonWidget({
    super.key,
    this.label,
    this.contentWidget,
    required this.onPressed,
    this.height,
    this.width,
    this.maxWidth,
    this.backgroundColorButton,
    this.textStyle,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (!isLoading && onPressed != null) {
            onPressed!();
          }
        },
        child: FittedBox(
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                )
              : Text(
                  label ?? '',
                  style: textStyle ??
                      AppTextStyle.normal(
                        color: AppColors.white,
                      ),
                ),
        ),
      ),
    );
  }
}
