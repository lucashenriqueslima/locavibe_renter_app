import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/dashboard/dashboard_controller.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_colors.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DashboardPage')),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.secondary,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.motorcycle_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            // WAQrScannerScreen().launch(context);
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        // clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          // backgroundColor: AppColors.scaffoldBackground,
          currentIndex: 1,
          onTap: (index) {},
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.third,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 20,
          useLegacyColorScheme: false,
          backgroundColor: AppColors.scaffoldBackground,
          elevation: 3,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.scaffoldBackground,
        ),
      ),
    );
  }
}
