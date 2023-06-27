import 'package:get/get.dart';

void showMySnackbar({required String msg}) {
  Get.isSnackbarOpen == true
      ? null
      : Get.rawSnackbar(
          message: msg,
          duration: const Duration(milliseconds: 2000),
        );
}
