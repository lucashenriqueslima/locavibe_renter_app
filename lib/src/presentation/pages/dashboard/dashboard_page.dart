import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_colors.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.scaffoldBackground,
        color: AppColors.white,
        items: const <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.sports_motorsports_outlined, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          // controller.changePage(index);
        },
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.scaffoldBackground,
        ),
      ),
    );
  }
}
