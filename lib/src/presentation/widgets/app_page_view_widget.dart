import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/extensions/widget_extension.dart';

class AppPageViewController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);

  final RxInt currentPage = 0.obs;

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      currentPage.value = currentPage.value + 1;
    });
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      currentPage.value = currentPage.value - 1;
    });
  }

  void changePage(int index) async {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      currentPage.value = index;
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class AppPageViewWidget extends GetWidget<AppPageViewController> {
  const AppPageViewWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: children,
    ).paddingBottom(20);
  }
}
