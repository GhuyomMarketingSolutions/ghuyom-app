import 'package:get/get.dart';
import 'package:ghuyom/app/modules/business/controllers/business_controller.dart';

import 'package:ghuyom/app/modules/home/controllers/home_controller.dart';
import 'package:ghuyom/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BusinessController>(
      () => BusinessController(),
    );
    // Get.lazyPut<FavouritesController>(
    //   () => FavouritesController(),
    // );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
