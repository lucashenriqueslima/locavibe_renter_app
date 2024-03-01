import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
