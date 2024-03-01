import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/dashboard/dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
