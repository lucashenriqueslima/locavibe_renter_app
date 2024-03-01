import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Splash Page'),
        ),
      ),
    );
  }
}
