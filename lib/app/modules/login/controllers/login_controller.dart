import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/routes/app_pages.dart';
import 'package:ghuyom/generated/locales.g.dart';
import 'package:ghuyom/main.dart';

import '../../../services/auth.dart';
import '../../../services/dio/api_service.dart';
import '../../../services/snackbar.dart';
import '../../../services/storage.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  TabController? tabController;

  RxBool isButtonActive = false.obs;
  RxBool isEmailButtonActive = false.obs;
  RxBool isObscure = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onNumberChange(String value) {
    if (value.length == 8) {
      isButtonActive.value = true;
    } else {
      isButtonActive.value = false;
    }
  }

  onEmailFormChange() {
    if (emailController.text != '' && passController.text != '') {
      isEmailButtonActive.value = true;
    } else {
      isEmailButtonActive.value = false;
    }
  }

  numberValidator(String? value) {
    if (value?.length != 8) {
      return LocaleKeys.please_enter_8.tr;
    }
  }

  onNumberContinueTap() async {
    if (await Get.find<AuthService>()
        .mobileOtp(phoneno: '+974${phoneController.text}')) {
      Get.toNamed(Routes.OTP,
          parameters: {'phone': '+974${phoneController.text}'});
    }
  }

  onSignUpTap() {
    Get.toNamed(Routes.SIGNUP);
  }

  onEmailContinueTap() async {
    if (await Get.find<AuthService>().loginEmailPass(
        email: emailController.text, pass: passController.text)) {
      await postLoginAPI();
    }
  }

  postLoginAPI() async {
    try {
      await APIManager.postLogin().then((value) => value.data['status']
          ? {
              Get.find<GetStorageService>().setName =
                  value.data['user']['name'],
              userName.value = Get.find<GetStorageService>().getName,
              Get.toNamed(Routes.NAVIGATION)
            }
          : showMySnackbar(msg: LocaleKeys.something_went_wrong.tr));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
