import 'dart:math';

import 'package:get/get.dart';
import 'package:ghuyom/app/modules/home/controllers/home_controller.dart';

import '../../../models/get_all_businesses_model.dart';
import '../../../routes/app_pages.dart';

class ListBusinessesController extends GetxController {
  RxString title = ''.obs;
  RxList<Businesses> businesses = <Businesses>[].obs;

  var lat = Get.find<HomeController>().lati;
  var long = Get.find<HomeController>().long;

  @override
  void onInit() {
    super.onInit();
    title.value = Get.arguments[0];
    businesses.value = Get.arguments[1];
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onListedBusinessTap(int index) {
    String distance = calculateDistance(
            businesses[index].location?.coordinates?[1],
            businesses[index].location?.coordinates?[0])
        .toStringAsFixed(2);
    return Get.toNamed(
      Routes.BUSINESS_DETAIL,
      arguments: businesses[index].id,
      parameters: {'distance': distance},
    );
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
