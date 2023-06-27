import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/services/index.dart';

import '../../../components/ghuyom_appbar.dart';
import '../../../components/ghuyom_text_field.dart';
import '../../../services/colors.dart';
import '../controllers/edit_email_password_controller.dart';

class EditEmailPasswordView extends GetView<EditEmailPasswordController> {
  const EditEmailPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: GhuyomAppbar(
            centerTitle: true,
            title: LocaleKeys.change_email_password.tr,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: ColorUtil.mainColorBlue,
                  size: 25.kh,
                ),
              ),
              05.kwidthBox
            ],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LocaleKeys.email.tr.text500(14.kh),
                    6.kheightBox,
                    GhuyomTextField(hint: LocaleKeys.your_email.tr),
                    20.kheightBox,
                    LocaleKeys.password.tr.text500(14.kh),
                    6.kheightBox,
                    GhuyomTextField(hint: LocaleKeys.your_password.tr),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
