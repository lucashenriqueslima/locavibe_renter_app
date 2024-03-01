import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/login/login_controller.dart';
import 'package:locavibe_renter_app/src/presentation/widgets/app_page_view_widget.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // Get.create(() => AppPageViewController());
    Get.lazyPut<LoginController>(
      () => LoginController(
        pageController: Get.put<AppPageViewController>(AppPageViewController()),
      ),
    );
  }
}
