import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('HomePage')),
        body: const SafeArea(child: Text('HomeController')));
  }
}
