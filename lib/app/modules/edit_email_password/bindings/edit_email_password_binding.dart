import 'package:get/get.dart';

import '../controllers/edit_email_password_controller.dart';

class EditEmailPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEmailPasswordController>(
      () => EditEmailPasswordController(),
    );
  }
}
