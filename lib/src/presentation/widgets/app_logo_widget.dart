import 'package:flutter/material.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_images.dart';

class AppLogoImageWidget extends StatelessWidget {
  const AppLogoImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      height: 84,
      width: 84,
    );
  }
}
