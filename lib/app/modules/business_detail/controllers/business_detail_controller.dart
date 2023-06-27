import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessDetailController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? tabController;

  RxString title = ''.obs;

  PageController pageViewController = PageController();

  RxBool isHeart = false.obs;

  @override
  void onInit() {
    super.onInit();
    title.value = Get.arguments;
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onHeartTap() {
    isHeart.toggle();
  }
}
