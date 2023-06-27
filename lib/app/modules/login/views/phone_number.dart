import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/components/ghuyom_button.dart';
import 'package:ghuyom/app/services/responsive_size.dart';
import 'package:ghuyom/app/services/text_style_util.dart';
import 'package:ghuyom/generated/locales.g.dart';

import '../controllers/login_controller.dart';

class PhoneNumber extends GetView<LoginController> {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        33.kheightBox,
        TextField(
          controller: controller.phoneController,
          inputFormatters: [
            //TODO:limit to 8
            LengthLimitingTextInputFormatter(10),
          ],
          onChanged: (value) => controller.onNumberChange(value),
          keyboardType: TextInputType.number,
          style: TextStyleUtil.manrope400(fontSize: 16.kh, color: Colors.black),
          decoration: InputDecoration(
              hintText: '0000 0000',
              hintStyle: TextStyleUtil.manrope400(
                  fontSize: 16.kh, color: Colors.black.withOpacity(0.5))),
        ),
        42.kheightBox,
        Obx(
          () => GhuyomButton(
            isActive: controller.isButtonActive.value,
            onPressed: () => controller.onNumberContinueTap(),
            label: LocaleKeys.xcontinue.tr,
          ),
        ),
        70.kheightBox,
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: LocaleKeys.dont_have_an.tr,
                  style: TextStyleUtil.manrope400(fontSize: 14.kh)),
              TextSpan(
                  text: LocaleKeys.sign_up.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => controller.onSignUpTap(),
                  style: TextStyleUtil.manrope600(fontSize: 14.kh)),
            ])),
      ],
    );
  }
}
