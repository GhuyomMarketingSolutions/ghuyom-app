
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AccountSettingsController extends GetxController {
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

  onNameTap() {
    Get.toNamed(Routes.EDIT_NAME);
  }

  onChangeEmailPassTap() {
    Get.toNamed(Routes.EDIT_EMAIL_PASSWORD);
  }
}
