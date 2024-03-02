import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:locavibe_renter_app/src/presentation/extensions/widget_extension.dart';
import 'package:locavibe_renter_app/src/presentation/pages/login/login_controller.dart';
import 'package:locavibe_renter_app/src/presentation/pages/login/widgets/token_text_form_field.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_colors.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_form_masks.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_images.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_text_style.dart';
import 'package:locavibe_renter_app/src/presentation/widgets/app_logo_widget.dart';
import 'package:locavibe_renter_app/src/presentation/widgets/app_page_view_widget.dart';
import 'package:locavibe_renter_app/src/presentation/widgets/app_primary_button_widget.dart';
import 'package:locavibe_renter_app/src/presentation/widgets/app_primary_text_form_field_widget.dart';
import 'package:locavibe_renter_app/src/presentation/widgets/app_text_button_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (controller.pageController.currentPage.value != 0) {
          controller.pageController.changePage(0);
        }
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              leading: Obx(() => Visibility(
                    visible: controller.pageController.currentPage.value != 0,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        if (controller.pageController.currentPage.value != 0) {
                          controller.pageController.changePage(0);
                        }
                      },
                    ),
                  )),
              title: const AppLogoImageWidget(),
              centerTitle: true,
            ),
            body: AppPageViewWidget(children: [
              FirstStep(controller: controller),
              SecondStep(controller: controller),
            ]),
          ),
        ),
      ),
    );
  }
}

class FirstStep extends StatelessWidget {
  const FirstStep({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(AppImages.bannerLogin, fit: BoxFit.cover),
          ).paddingTop(10),
          const SizedBox(height: 20),
          Text('Bem-vindo,',
              style: AppTextStyle.normal(color: AppColors.secondaryText)),
          const SizedBox(height: 6),
          Text('Faça seu Login', style: AppTextStyle.bold(fontSize: 20)),
          const SizedBox(height: 30),
          AppPrimaryTextFormFieldWidget(
            label: 'CPF',
            hintText: 'Digite seu CPF',
            onTapOutsideCloseKeyboard: false,
            inputFormatters: [AppFormMasks.cpf()],
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 30),
          AppPrimaryButtonWidget(
            label: 'Entrar',
            onPressed: () {
              controller.pageController.changePage(1);

              Future.delayed(const Duration(milliseconds: 500), () {
                controller.tokenTextFormFieldNodes[0].requestFocus();
              });
            },
          ),
          const SizedBox(height: 20),
          Align(
              alignment: Alignment.center,
              child: AppTextButton(
                decoration: TextDecoration.underline,
                label: 'Ou cadastre-se aqui',
                onPressed: () {},
              )),
        ],
      ).paddingAll(16),
    );
  }
}

class SecondStep extends StatelessWidget {
  const SecondStep({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: controller.tokenFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "Enviamos um código para o seu e-mail cadastrado. Insira o código abaixo para continuar.",
                  style: AppTextStyle.bold(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 42),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 150,
                    height: 150,
                  ),
                  Positioned(
                    child: SvgPicture.asset(
                      AppImages.lockerCode,
                      width: 100,
                      height: 100,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryDarkVariant,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Wrap(
                spacing: 24,
                children: List.generate(
                  4,
                  (index) {
                    return SizedBox(
                      height: 100,
                      width: 60,
                      child: TokenTextFormFieldWidget(
                        // controller: controller.textEditingController[index],
                        nextFocusNode:
                            controller.tokenTextFormFieldNodes[index + 1],
                        focusNode: controller.tokenTextFormFieldNodes[index],
                        textInputAction: index == 3
                            ? TextInputAction.done
                            : TextInputAction.next,
                        textAlign: TextAlign.center,
                        textStyle: AppTextStyle.bold(
                          fontSize: 24,
                        ),
                        onChanged: (value) =>
                            controller.changeFocusToNextInput(value, index),
                      ),
                    );
                  },
                ),
              ),
              AppTextButton(onPressed: () {}, label: 'Reenviar código'),
              const SizedBox(height: 20),
              AppPrimaryButtonWidget(
                label: 'Entrar',
                onPressed: () {
                  controller.pageController.changePage(1);

                  Future.delayed(const Duration(milliseconds: 500), () {
                    controller.tokenTextFormFieldNodes[0].requestFocus();
                  });
                },
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
