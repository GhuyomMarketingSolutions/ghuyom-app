import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/modules/signup/controllers/signup_controller.dart';
import 'package:ghuyom/app/services/index.dart';

class SignUpPhone extends GetView<SignupController> {
  const SignUpPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                LocaleKeys.continue_with_phone.tr
                    .text400(16.kh, color: Colors.black.withOpacity(0.7)),
                22.kheightBox,
                TextField(
                  controller: controller.phoneController,
                  inputFormatters: [
                    //TODO: change to 8
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: (value) => controller.onNumberChange(value),
                  keyboardType: TextInputType.number,
                  style: TextStyleUtil.manrope400(
                      fontSize: 16.kh, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: '0000 0000',
                      hintStyle: TextStyleUtil.manrope400(
                          fontSize: 16.kh,
                          color: Colors.black.withOpacity(0.5))),
                ),
                42.kheightBox,
                Obx(
                  () => GhuyomButton(
                    isActive: controller.isPhoneButtonActive.value,
                    onPressed: () => controller.isPhoneButtonActive.value
                        ? controller.onPhoneContinueTap()
                        : null,
                    label: LocaleKeys.xcontinue.tr,
                  ),
                ),
                const Spacer(),
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
                70.kheightBox
              ],
            ),
          )),
    );
  }
}
