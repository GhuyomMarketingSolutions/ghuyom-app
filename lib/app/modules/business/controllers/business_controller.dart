import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ghuyom/app/services/dio/api_service.dart';

import '../../../models/get_all_businesses_model.dart';
import '../../../routes/app_pages.dart';

class BusinessController extends GetxController {
  RxList<Businesses> businesses = <Businesses>[].obs;

  @override
  void onInit() {
    super.onInit();
    getListedBusinesses();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  getListedBusinesses() async {
    try {
      await APIManager.getAllBusiness().then((value) => businesses.value =
          GetAllBusinessesModel.fromJson(value.data).businesses ?? []);
    } catch (e) {
      log(e.toString());
    }
  }

  onDeleteBusinessTap(int index) async {
    try {
      await APIManager.deleteBusiness(businessId: businesses[index].id ?? '')
          .then((value) => businesses.removeAt(index));
    } catch (e) {
      log(e.toString());
    }
  }

  onAddYourBusinessTap() {
    Get.toNamed(Routes.ADD_BUSINESS);
  }

  onEditTap(BuildContext context) async {


    // Get.toNamed(Routes.ADD_BUSINESS, arguments: businesses[index]);
  }
}
