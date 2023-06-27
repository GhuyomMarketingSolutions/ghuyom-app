import 'package:get/get.dart';

import '../controllers/list_businesses_controller.dart';

class ListBusinessesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListBusinessesController>(
      () => ListBusinessesController(),
    );
  }
}
