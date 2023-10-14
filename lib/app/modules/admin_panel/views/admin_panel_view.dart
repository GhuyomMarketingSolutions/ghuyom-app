// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/storage.dart';
import '../controllers/admin_panel_controller.dart';
import 'admin_panel_button.dart';

class AdminPanelView extends GetView<AdminPanelController> {
  const AdminPanelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AdminPanelView'),
          centerTitle: true,
          // backgroundColor: ColorUtil.mainColor1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AdminPanelButton(
                  label: 'Splash',
                  onPressed: () => Get.toNamed(Routes.SPLASH),
                ),
                AdminPanelButton(
                  label: 'Login',
                  onPressed: () => Get.toNamed(Routes.LOGIN),
                ),
                AdminPanelButton(
                  label: 'SignUp',
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                ),
                AdminPanelButton(
                  label: 'Create Account',
                  onPressed: () => Get.toNamed(Routes.CREATE_ACCOUNT),
                ),
                AdminPanelButton(
                  label: 'Navigation',
                  onPressed: () => Get.toNamed(Routes.NAVIGATION),
                ),
                AdminPanelButton(
                  label: 'service',
                  onPressed: () => Get.toNamed(Routes.ADD_SERVICE),
                ),
                AdminPanelButton(
                  label: 'Print Token',
                  onPressed: () =>
                      print(Get.find<GetStorageService>().getEncjwToken),
                ),
              ],
            ),
          ),
        ));
  }
}
