import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/dio/api_service.dart';
import 'package:ghuyom/app/services/storage.dart';
import 'package:ghuyom/generated/locales.g.dart';
import 'package:ghuyom/main.dart';

class EditNameController extends GetxController {
  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    nameController.text = Get.find<GetStorageService>().getName;
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  commonValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.please_enter.tr;
    }
  }

  onCorrectTap() {
    if (formKey.currentState!.validate()) {
      updateUserAPI();
    }
  }

  updateUserAPI() async {
    try {
      await APIManager.putUpdateUser(body: {"name": nameController.text})
          .then((value) {
        Get.find<GetStorageService>().setName = value.data['user']['name'];
        userName.value = Get.find<GetStorageService>().getName;
        Get.back();
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
