import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/services/storage.dart';

import '../../../components/ghuyom_appbar.dart';
import '../../../services/colors.dart';
import '../../../services/index.dart';
import '../controllers/account_settings_controller.dart';

class AccountSettingsView extends GetView<AccountSettingsController> {
  const AccountSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GhuyomAppbar(
          centerTitle: true,
          title: LocaleKeys.account_settings.tr,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              height: 1.kh,
              thickness: 1.kh,
              color: const Color(0xffd9d9d9),
            ),
            40.kheightBox,
            Padding(
              padding: 20.paddingHorizontal,
              child: ListTile(
                onTap: () => controller.onNameTap(),
                title: LocaleKeys.name.tr.text400(16.kh),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Get.find<GetStorageService>()
                        .getName
                        .text400(16.kh, color: const Color(0xff909090)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 17.kh,
                      color: ColorUtil.mainColorBlue,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: const Color(0xfff1f1f1),
              thickness: 1.kh,
            ),
            Padding(
              padding: 20.paddingHorizontal,
              child: ListTile(
                onTap: () => controller.onChangeEmailPassTap(),
                title: LocaleKeys.change_email_password.tr.text400(16.kh),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.kh,
                  color: ColorUtil.mainColorBlue,
                ),
              ),
            ),
            Divider(
              color: const Color(0xfff1f1f1),
              thickness: 1.kh,
            ),
          ],
        ));
  }
}
