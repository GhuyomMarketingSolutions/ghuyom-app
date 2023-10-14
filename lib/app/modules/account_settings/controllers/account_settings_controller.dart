import 'package:get/get.dart';
import 'package:ghuyom/app/services/dialog_helper.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';

class AccountSettingsController extends GetxController {
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

  onNameTap() {
    Get.toNamed(Routes.EDIT_NAME);
  }

  onChangePassTap() async {
    DialogHelper.showLoading();
    await Get.find<AuthService>().changePasswordLink();
    DialogHelper.hideDialog();
  }
}
