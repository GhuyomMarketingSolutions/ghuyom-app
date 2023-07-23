import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PersistentTabController pageViewController = PersistentTabController();
  RxInt pageNo = 0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onIconTap(int value) {
    pageNo.value = value;
    pageViewController.jumpToTab(pageNo.value);
  }
}
