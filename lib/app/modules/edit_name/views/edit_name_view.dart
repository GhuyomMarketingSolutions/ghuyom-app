import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/components/ghuyom_text_field.dart';
import 'package:ghuyom/app/services/colors.dart';
import 'package:ghuyom/app/services/index.dart';

import '../../../components/ghuyom_appbar.dart';
import '../controllers/edit_name_controller.dart';

class EditNameView extends GetView<EditNameController> {
  const EditNameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: GhuyomAppbar(
            centerTitle: true,
            title: LocaleKeys.your_name.tr,
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
                    LocaleKeys.name.tr.text500(14.kh),
                    6.kheightBox,
                    GhuyomTextField(hint: LocaleKeys.your_name.tr),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
