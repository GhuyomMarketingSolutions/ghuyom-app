import 'package:get/get.dart';

import '../controllers/add_business_controller.dart';

class AddBusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBusinessController>(
      () => AddBusinessController(),
    );
  }
}
