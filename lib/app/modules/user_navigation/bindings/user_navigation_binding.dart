import 'package:get/get.dart';
import 'package:ghuyom/app/modules/home/controllers/home_controller.dart';
import 'package:ghuyom/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/user_navigation_controller.dart';

class UserNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserNavigationController>(
      () => UserNavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
