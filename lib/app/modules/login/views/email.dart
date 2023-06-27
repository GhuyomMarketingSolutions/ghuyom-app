import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ghuyom/app/components/ghuyom_text_field.dart';
import 'package:ghuyom/app/services/responsive_size.dart';
import 'package:ghuyom/generated/locales.g.dart';

import '../../../components/common_image_view.dart';
import '../../../components/ghuyom_button.dart';
import '../../../constants/image_constant.dart';
import '../../../services/text_style_util.dart';
import '../controllers/login_controller.dart';

class Email extends GetView<LoginController> {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        22.kheightBox,
        GhuyomTextField(
          onChanged: (p0) => controller.onEmailFormChange(),
          controller: controller.emailController,
          hint: LocaleKeys.enter_your_email.tr,
          label: LocaleKeys.email.tr,
        ),
        22.kheightBox,
        Obx(
          () => GhuyomTextField(
            onChanged: (p0) => controller.onEmailFormChange(),
            controller: controller.passController,
            isObscure: controller.isObscure.value,
            hint: LocaleKeys.enter_your_password.tr,
            label: LocaleKeys.password.tr,
            suffixIcon: Padding(
              padding: 20.paddingRight,
              child: GestureDetector(
                onTap: () => controller.isObscure.toggle(),
                child: CommonImageView(
                  fit: BoxFit.contain,
                  svgPath: controller.isObscure.value
                      ? ImageConstant.svgEyeOff
                      : ImageConstant.svgEyeOn,
                  height: 20.kh,
                  width: 20.kh,
                ),
              ),
            ),
          ),
        ),
        35.kheightBox,
        Obx(
          () => GhuyomButton(
            isActive: controller.isEmailButtonActive.value,
            onPressed: () => controller.onEmailContinueTap(),
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
