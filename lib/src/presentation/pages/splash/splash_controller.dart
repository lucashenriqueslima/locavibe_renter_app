import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.login);
    });
  }
}
