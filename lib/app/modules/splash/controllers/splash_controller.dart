import 'package:get/get.dart';
import 'package:ghuyom/app/modules/splash/views/choose_type_login.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.to(() =>
            ChooseTypeLogin()); // if (Get.find<GetStorasgeService>().getIsLoggedIn) {
        //   Get.offNamed(Routes.NAVIGATION);
        // } else {
        // Get.offNamed(Routes.LOGIN);
        // }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  onLoginTap() {
    Get.toNamed(Routes.LOGIN);
  }
}
