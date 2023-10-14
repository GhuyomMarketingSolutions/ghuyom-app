import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/modules/splash/views/choose_type_login.dart';
import 'package:ghuyom/app/services/auth.dart';
import 'package:ghuyom/app/services/dialog_helper.dart';
import 'package:ghuyom/app/services/snackbar.dart';
import 'package:ghuyom/app/services/storage.dart';
import 'package:ghuyom/generated/locales.g.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (Get.find<GetStorageService>().getIsUser) {
          Get.offNamed(Routes.USER_NAVIGATION);
        } else if (Get.find<GetStorageService>().getName != '') {
          Get.offNamed(Routes.NAVIGATION);
        } else {
          Get.off(() => const ChooseTypeLogin(),
              duration: const Duration(milliseconds: 1500));
        }
      },
    );
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onLoginTap() => Get.toNamed(Routes.LOGIN);

  onGuestTap() async {
    if (await Get.find<AuthService>().loginAnonynously()) {
      Get.find<GetStorageService>().setIsUser = true;
      Get.toNamed(Routes.USER_NAVIGATION);
    } else {

      showMySnackbar(msg: LocaleKeys.something_went_wrong.tr);
    }
  }

  onJoinTap() => Get.toNamed(Routes.SIGNUP);
}
