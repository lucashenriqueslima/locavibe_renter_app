import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/dashboard/dashboard_binding.dart';
import 'package:locavibe_renter_app/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:locavibe_renter_app/src/presentation/pages/home/home_binding.dart';
import 'package:locavibe_renter_app/src/presentation/pages/home/home_page.dart';
import 'package:locavibe_renter_app/src/presentation/pages/login/login_binding.dart';
import 'package:locavibe_renter_app/src/presentation/pages/login/login_page.dart';
import 'package:locavibe_renter_app/src/presentation/pages/splash/splash_binding.dart';
import 'package:locavibe_renter_app/src/presentation/pages/splash/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
