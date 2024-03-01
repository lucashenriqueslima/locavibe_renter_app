import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
