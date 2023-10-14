import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ghuyom/generated/locales.g.dart';
import 'package:ghuyom/main.dart';

import '../../../routes/app_pages.dart';
import '../../../services/dio/api_service.dart';
import '../../../services/snackbar.dart';
import '../../../services/storage.dart';

class CreateAccountController extends GetxController {
  TextEditingController nameController = TextEditingController();

  RxInt radioVal = 1.obs;

  RxBool isObscure = true.obs;
  RxBool isCheck = false.obs;
  RxBool isButtonActive = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onRadioTap(int? value) {
    radioVal.value = value ?? 0;
  }

  onCheckTap(bool? value) {
    isCheck.value = value ?? false;
  }

  onFormChange() {
    if (nameController.text != '' &&
        radioVal.value != 0 &&
        isCheck.value != false) {
      isButtonActive.value = true;
    } else {
      isButtonActive.value = false;
    }
  }

  emailValidator(String? value) {
    if (!(value?.isEmail ?? true)) {
      return LocaleKeys.please_enter_email.tr;
    }
  }

  onConfirmTap() async {
    if (isButtonActive.value) {
      if (formKey.currentState!.validate()) {
        await postOnboardingAPI();
      }
    }
  }

  postOnboardingAPI() async {
    try {
      await APIManager.postOnboarding(body: {
        "name": nameController.text,
        "gender": radioVal.value == 0 ? "female" : "male"
      }).then((value) => value.data['status']
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
