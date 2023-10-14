import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/modules/profile/controllers/profile_controller.dart';
import 'package:ghuyom/app/services/index.dart';

import '../../../components/ghuyom_appbar.dart';

class Terms extends GetView<ProfileController> {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          GhuyomAppbar(title: LocaleKeys.terms_of_use.tr, centerTitle: true),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 20.kh),
        children: List.generate(
            controller.privacy.length,
            (index) => Text.rich(TextSpan(children: [
                  TextSpan(
                      text:
                          '${index + 1}. ${controller.privacy[index].split(':')[0]}: ',
                      style: TextStyleUtil.manrope700(fontSize: 16.kh)),
                  TextSpan(
                      text: '${controller.privacy[index].split(':')[1]}\n',
                      style: TextStyleUtil.manrope500(fontSize: 16.kh)),
                ]))),
      ),
    );
  }
}
