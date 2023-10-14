import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/dio/api_service.dart';
import 'package:ghuyom/app/services/storage.dart';
import 'package:ghuyom/generated/locales.g.dart';
import 'package:ghuyom/main.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';
import '../../../services/snackbar.dart';

class OtpController extends GetxController {
  TextEditingController otpController = TextEditingController();

  int timer = 5;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    decreaseTime();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  decreaseTime() async {
    for (var i = 0; i < 5; i++) {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          timer = timer - 1;
          update();
        },
      );
    }
  }

  onOtpComplete(String value) async {
    otpController.text = value;

    if (await Get.find<AuthService>().verifyMobileOtp(
        otp: otpController.text, type: Get.parameters['newAccount'] ?? '')) {
      if (Get.parameters['newAccount'] == 'newAccount') {
        Get.toNamed(Routes.CREATE_ACCOUNT);
      } else {
        await postLoginAPI();
      }
    }
  }

  postLoginAPI() async {
    try {
      await APIManager.postLogin().then((value) => value.data['status']
          ? {
              Get.find<GetStorageService>().setName =
                  value.data['user']['name'],
              userName.value = Get.find<GetStorageService>().getName,
              Get.toNamed(Routes.NAVIGATION),
            }
          : showMySnackbar(msg: LocaleKeys.something_went_wrong.tr));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
