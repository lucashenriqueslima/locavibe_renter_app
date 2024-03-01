import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/widgets/app_page_view_widget.dart';
import 'package:locavibe_renter_app/src/routes/app_pages.dart';

class LoginController extends GetxController {
  LoginController({required this.pageController});
  final AppPageViewController pageController;

  final Rx<bool> isLoading = false.obs;

  final emailOrCpfFormKey = GlobalKey<FormState>();
  final tokenFormKey = GlobalKey<FormState>();

  List<FocusNode> tokenTextFormFieldNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  void changeFocusToNextInput(String value, int index) {
    if (value.isNotEmpty && index != 3) {
      tokenTextFormFieldNodes[index].unfocus();
      tokenTextFormFieldNodes[index + 1].requestFocus();

      return;
    }

    if (value.isEmpty && index != 0) {
      tokenTextFormFieldNodes[index].unfocus();
      tokenTextFormFieldNodes[index - 1].requestFocus();

      return;
    }

    if (value.isNotEmpty && index == 3) {
      signIn();
    }
  }

  void signIn() {
    isLoading.value = true;

    Get.offAllNamed(Routes.dashboard);
  }

  @override
  void onClose() {
    pageController.dispose();
    for (var node in tokenTextFormFieldNodes) {
      node.dispose();
    }

    super.onClose();
  }
}
