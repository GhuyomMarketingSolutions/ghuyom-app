import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/components/ghuyom_appbar.dart';
import 'package:ghuyom/app/modules/profile/controllers/profile_controller.dart';
import 'package:ghuyom/app/services/index.dart';

class PrivacyPolicy extends GetView<ProfileController> {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          GhuyomAppbar(title: LocaleKeys.privacy_policy.tr, centerTitle: true),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 20.kh),
        children: List.generate(
            controller.terms.length,
            (index) => Text.rich(TextSpan(children: [
                  TextSpan(
                      text:
                          '${index + 1}. ${controller.terms[index].split(':')[0]}: ',
                      style: TextStyleUtil.manrope700(fontSize: 16.kh)),
                  TextSpan(
                      text: '${controller.terms[index].split(':')[1]}\n',
                      style: TextStyleUtil.manrope500(fontSize: 16.kh)),
                ]))),
      ),
    );
  }
}
