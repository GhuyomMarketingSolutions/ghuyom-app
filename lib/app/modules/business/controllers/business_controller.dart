import 'dart:developer';
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
      await APIManager.getOwnerBusiness().then((value) => businesses.value =
          GetAllBusinessesModel.fromJson(value.data).businesses ?? []);
      // print(businesses[0].id);
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

  onEditTap(int index, int type) async {
    type == 0
        ? Get.toNamed(Routes.ADD_BUSINESS, arguments: businesses[index])
        : Get.toNamed(Routes.ADD_SERVICE, arguments: businesses[index].id);
  }
}
