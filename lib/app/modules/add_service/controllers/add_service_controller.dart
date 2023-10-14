import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:ghuyom/app/services/dio/api_service.dart';
import 'package:ghuyom/app/services/snackbar.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/locales.g.dart';
import '../../../models/get_all_services.dart';
import '../../business/controllers/business_controller.dart';

class AddServiceController extends GetxController {
  RxList<Services> services = <Services>[].obs;

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
    getAllServices();
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

  onDoneTap() async {
    if (formKey.currentState!.validate()) {
      if (file == null) {
        showMySnackbar(msg: LocaleKeys.please_add_picture.tr);
      } else {
        //TOdo: check API connectivity

        await addPhoto();
      }
    }
  }

  addService() async {
    try {
      await APIManager.addService(body: {
        "name": nameController.text,
        "description": descriptionController.text,
        "price": int.parse(priceController.text.trim()),
        "image": imageUrl
      }, businessId: businessId ?? '')
          .then((value) async {
        nameController.clear();
        descriptionController.clear();
        priceController.clear();
        file = null;
        await getAllServices();
        Get.back();
      });
    } catch (e) {
      log(e.toString());
    }
  }

  addPhoto() async {
    try {
      await APIManager.addSinglePhoto(
          body: FormData.fromMap({
        'file': [
          await MultipartFile.fromFile(file?.path ?? ''),
        ],
        'type': 'service'
      })).then((value) async {
        if (value.data['status']) {
          imageUrl = value.data['url'];
          // print(imageUrl);
          await addService();
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  getAllServices() async {
    try {
      await APIManager.getAllServices(businessId: businessId ?? '').then(
          (value) => services.value =
              GetAllServices.fromJson(value.data).services ?? []);
    } catch (e) {
      log(e.toString());
    }
  }

  onDeleteBusinessTap(int index) async {
    try {
      // print(services.length);
      await APIManager.deleteService(serviceId: services[index].id ?? '')
          .then((value) {
        services.removeAt(index);
        // print(services.length);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  onServicePageDone() async {
    await Get.find<BusinessController>().getListedBusinesses();
    Get.back();
  }
}
