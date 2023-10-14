import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/services/responsive_size.dart';

import '../../../../generated/locales.g.dart';
import '../../../components/common_image_view.dart';
import '../../../components/ghuyom_button.dart';

import '../../../components/ghuyom_text_field.dart';
import '../../../constants/image_constant.dart';
import '../../../services/text_style_util.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Padding(
        padding: 20.paddingHorizontal,
        child: Form(
          key: controller.formKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              48.kheightBox,
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: GhuyomRoundedBox(
              //       onTap: () => Get.back(),
              //       borderWidth: 1.kh,
              //       height: 39.kh,
              //       width: 39.kh,
              //       isBorder: true,
              //       borderColor: const Color(0xffD8DADC),
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 15.kw, vertical: 12.kh),
              //         child: CommonImageView(
              //           svgPath: ImageConstant.svgBackArrow,
              //         ),
              //       )),
              // ),
              34.kheightBox,
              LocaleKeys.sign_up.tr.text600(30.kh),
              35.kheightBox,
              LocaleKeys.sign_up_with.tr
                  .text400(16.kh, color: Colors.black.withOpacity(0.7)),
              22.kheightBox,
              22.kheightBox,
              GhuyomTextField(
                validator: (value) => controller.emailValidator(value),
                onChanged: (p0) => controller.onFormChange(),
                controller: controller.emailController,
                hint: LocaleKeys.enter_your_email.tr,
                label: LocaleKeys.email.tr,
              ),
              22.kheightBox,
              Obx(
                () => GhuyomTextField(
                  onChanged: (p0) => controller.onFormChange(),
                  validator: (value) => controller.passwordValidator(value),
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
              22.kheightBox,
              Obx(
                () => GhuyomTextField(
                  validator: (value) => controller.confirmPassValidator(value),
                  onChanged: (p0) => controller.onFormChange(),
                  controller: controller.confirmPassController,
                  isObscure: controller.isObscure.value,
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
                  hint: LocaleKeys.repeat_your_password.tr,
                  label: LocaleKeys.confirm_password.tr,
                ),
              ),
              35.kheightBox,
              Obx(
                () => GhuyomButton(
                  isActive: controller.isButtonActive.value,
                  onPressed: () => controller.isButtonActive.value
                      ? controller.onContinueTap()
                      : null,
                  label: LocaleKeys.xcontinue.tr,
                ),
              ),
              70.kheightBox,
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: LocaleKeys.already_have_an.tr,
                        style: TextStyleUtil.manrope400(fontSize: 14.kh)),
                    TextSpan(
                        text: LocaleKeys.log_in.tr,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => controller.onLoginTap(),
                        style: TextStyleUtil.manrope600(fontSize: 14.kh)),
                  ])),
            ],
          ),
        ),
      )),
    );
  }
}
