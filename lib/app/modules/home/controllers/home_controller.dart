import 'package:get/get.dart';
import 'package:ghuyom/app/modules/navigation/controllers/navigation_controller.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  RxBool isShow = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onShowAllLessTap() {
    isShow.toggle();
  }

  onCategoryTileTap(String title) {
    Get.toNamed(Routes.LIST_BUSINESSES, arguments: title);
  }

  onAddMyBusinessTap() {
    print('object');
    Get.find<NavigationController>().onIconTap(1);
  }
}
