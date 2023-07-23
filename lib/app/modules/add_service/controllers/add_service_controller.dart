import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/dio/api_service.dart';
import 'package:ghuyom/app/services/snackbar.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/locales.g.dart';

class AddServiceController extends GetxController {
  File? file;

  RxBool isDone = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? businessId;
  String? imageUrl;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    businessId = Get.arguments;
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

  getServices() async {}

  onAddPictureTap() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        file = File(image.path);
      }
      update();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  onDoneTap() {
    if (formKey.currentState!.validate()) {
      if (file == null) {
        showMySnackbar(msg: LocaleKeys.please_add_picture.tr);
      } else {}
    }
  }

  addService() async {
    try {
      await APIManager.addService(body: {
        "name": nameController.text,
        "description": descriptionController.text,
        "price": int.parse(priceController.text),
        "image": imageUrl
      }, businessId: businessId ?? '');
    } catch (e) {
      log(e.toString());
    }
  }
}
