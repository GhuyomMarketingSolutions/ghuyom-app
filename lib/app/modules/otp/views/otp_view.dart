import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/components/common_image_view.dart';
import 'package:ghuyom/app/components/ghuyom_rounded_box.dart';
import 'package:ghuyom/app/constants/image_constant.dart';
import 'package:ghuyom/app/services/responsive_size.dart';
import 'package:ghuyom/app/services/text_style_util.dart';

import '../../../../generated/locales.g.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: 20.paddingHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          48.kheightBox,
          Align(
            alignment: Alignment.centerLeft,
            child: GhuyomRoundedBox(
                onTap: () => Get.back(),
                borderWidth: 1.kh,
                height: 39.kh,
                width: 39.kh,
                isBorder: true,
                borderColor: const Color(0xffD8DADC),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.kw, vertical: 12.kh),
                  child: CommonImageView(
                    svgPath: ImageConstant.svgBackArrow,
                  ),
                )),
          ),
          34.kheightBox,
          LocaleKeys.enter_a_code.tr.text700(30.kh),
          36.kheightBox,
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: LocaleKeys.weve_sent_an.tr,
                style: TextStyleUtil.manrope400(
                    fontSize: 16.kh, color: Colors.black.withOpacity(0.7))),
            TextSpan(
                text: Get.parameters['phone'],
                style: TextStyleUtil.manrope400(fontSize: 16.kh))
          ])),
          36.kheightBox,
          OtpTextField(
            showFieldAsBox: true,
            fieldWidth: 45.kw,
            keyboardType: TextInputType.number,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            borderRadius: BorderRadius.circular(15.kh),
            borderWidth: 1.kh,
            onSubmit: (value) => controller.onOtpComplete(value),
            autoFocus: true,
            enabledBorderColor: const Color(0xffD8DADC),
            textStyle:
                TextStyleUtil.manrope500(fontSize: 16.kh, color: Colors.black),
            borderColor: Colors.black,
            focusedBorderColor: Colors.black,
            numberOfFields: 6,
          ),
          const Spacer(),
          GetBuilder(
            builder: (OtpController controller) => controller.timer != 0
                ? RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: LocaleKeys.send_code_again.tr,
                          style: TextStyleUtil.manrope600(
                              fontSize: 16.kh,
                              color: Colors.black.withOpacity(0.7))),
                      TextSpan(
                          text: '00 : ${controller.timer.toString()}',
                          style: TextStyleUtil.manrope400(
                              fontSize: 16.kh,
                              color: Colors.black.withOpacity(0.7)))
                    ]))
                : RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: LocaleKeys.didnt_receive.tr,
                          style: TextStyleUtil.manrope400(
                              fontSize: 16.kh,
                              color: Colors.black.withOpacity(0.7))),
                      TextSpan(
                          text: LocaleKeys.Resend.tr,
                          style: TextStyleUtil.manrope600(
                              fontSize: 16.kh, color: Colors.black))
                    ])),
          ),
          30.kheightBox
        ],
      ),
    ));
  }
}
