import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ListBusinessesController extends GetxController {
  RxString title = ''.obs;
  @override
  void onInit() {
    super.onInit();
    title.value = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onListedBusinessTap() {
    Get.toNamed(Routes.BUSINESS_DETAIL, arguments: title.value);
  }
}
