import 'dart:developer' as log;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/dio/api_service.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../models/get_business_model.dart';
import '../../../services/snackbar.dart';
import '../../home/controllers/home_controller.dart';

class BusinessDetailController extends GetxController {
  Rxn<GetBusinessModel> business = Rxn<GetBusinessModel>();
  var lat = Get.find<HomeController>().lati;
  var long = Get.find<HomeController>().long;

  RxList<String> days = <String>['M', 'T', 'W', 'T', 'F', 'S', 'S'].obs;

  RxList<bool> daysBool =
      <bool>[false, false, false, false, false, false, false].obs;

  PageController pageViewController = PageController();

  // RxBool isHeart = false.obs;

  @override
  void onInit() {
    super.onInit();
    getbusinessAPI();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // onHeartTap() {
  //   isHeart.toggle();
  // }

  getbusinessAPI() async {
    try {
      await APIManager.getABusiness(businessId: Get.arguments).then((value) {
        business.value = GetBusinessModel.fromJson(value.data);
        int xyz = business.value?.business?.workingHours?.days?.length ?? 0;
        List x = [];
        for (var i = 0; i < xyz; i++) {
          switch (business.value?.business?.workingHours?.days?[i]) {
            case 1:
              x.add(1);
              daysBool[0] = true;
              break;
            case 2:
              x.add(2);
              daysBool[1] = true;

              break;
            case 3:
              x.add(3);
              daysBool[2] = true;

              break;
            case 4:
              x.add(4);
              daysBool[3] = true;

              break;
            case 5:
              x.add(5);
              daysBool[4] = true;

              break;
            case 6:
              x.add(6);
              daysBool[5] = true;

              break;
            case 7:
              x.add(7);
              daysBool[6] = true;

              break;
            default:
          }
        }
      });
    } catch (e) {
      log.log(e.toString());
    }
  }

  onLinkTap(String? link) async {
    if (!await launchUrlString(link ?? '',
        mode: LaunchMode.externalApplication)) {
      throw {
        Exception('Could not launch url'),
        showMySnackbar(msg: 'Something went wrong')
      };
    }
  }

  onDirectionsTap(List<double> coordinates) async {
    if (!await launchUrlString(
        'https://www.google.com/maps/search/?api=1&query=${coordinates[1]}%2C${coordinates[0]}',
        mode: LaunchMode.externalApplication)) {
      throw {
        Exception('Could not launch url'),
        showMySnackbar(msg: 'Something went wrong')
      };
    }
  }

  double calculateDistance(lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat) * p) / 2 +
        c(lat ?? 0 * p) * c(lat2 * p) * (1 - c((lon2 - long) * p)) / 2;
    return 12742 * asin(sqrt(a));
    //return in KM
  }
}
