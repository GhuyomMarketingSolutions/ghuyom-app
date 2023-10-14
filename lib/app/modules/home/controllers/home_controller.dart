import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:ghuyom/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:ghuyom/app/services/snackbar.dart';
import 'package:ghuyom/generated/locales.g.dart';

import '../../../models/get_all_businesses_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/determine_location.dart';
import '../../../services/dialog_helper.dart';
import '../../../services/dio/api_service.dart';

class HomeController extends GetxController {
  RxBool isShow = false.obs;

  RxString cityName = ''.obs;
  double? lati, long;

  TextEditingController searchController = TextEditingController();

  List<Businesses> businesses = [];

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onShowAllLessTap() => isShow.toggle();

  onCategoryTileTap(String title) async {
    await getCategoryBusiness(title);
  }

  onAddMyBusinessTap() => Get.find<NavigationController>().onIconTap(1);

  onSearchTap(Map<String, dynamic> suggestion) =>
      Get.toNamed(Routes.BUSINESS_DETAIL, arguments: suggestion['_id']);

  Future<List<Map<String, dynamic>>> searchedItems(String pattern) async {
    if (pattern == '') {
      return [];
    }
    {
      return await Future.delayed(const Duration(milliseconds: 1000), () async {
        List<Map<String, dynamic>> data = [];

        try {
          await APIManager.getSearchResult(
                  keyword: pattern.trim(),
                  longitude: long.toString(),
                  latitude: lati.toString())
              .then((value) {
            if (value.data['status'] && value.data['data'].length != 0) {
              data = List.generate(
                  value.data['data'].length,
                  (index) => {
                        "_id": value.data['data'][index]['_id'],
                        "name": value.data['data'][index]['name'],
                        "image": value.data['data'][index]['image'],
                        "category": value.data['data'][index]['category'],
                        "subCategory": value.data['data'][index]['subCategory']
                      });
              // print(data.length);
            } else {
              showMySnackbar(msg: LocaleKeys.no_result.tr);
            }
          });
          return data;
        } catch (e) {
          log(e.toString());
          showMySnackbar(msg: LocaleKeys.no_result.tr);
          return data;
        }
      });
    }
  }

  void getLocation() async {
    Position? pos;
    try {
      pos = await DetermineLocation.determinePosition();
      lati = pos.latitude;
      long = pos.longitude;
      // print('latitude : $lati');
      // print('longitude : $long');
      DialogHelper.hideDialog();
    } on Exception catch (e) {
      DialogHelper.hideDialog();
      debugPrint(e.toString());
    }
    await placemarkFromCoordinates(pos?.latitude ?? 0, pos?.longitude ?? 0)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      cityName.value =
          '${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.country}';
    });
  }

  getCategoryBusiness(String category) async {
    try {
      await APIManager.getCategoryBusiness(category: category).then((value) {
        // print(value.data);
        businesses =
            GetAllBusinessesModel.fromJson(value.data).businesses ?? [];
        return Get.toNamed(Routes.LIST_BUSINESSES,
            arguments: [category, businesses]);
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
