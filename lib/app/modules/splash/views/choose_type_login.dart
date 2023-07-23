import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:ghuyom/app/modules/splash/controllers/splash_controller.dart';
import 'package:ghuyom/app/services/colors.dart';
import 'package:ghuyom/app/services/index.dart';

class ChooseTypeLogin extends GetView<SplashController> {
  const ChooseTypeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CommonImageView(
              height: 100.h,
              width: 100.w,
              fit: BoxFit.cover,
              imagePath: ImageConstant.svgSplashView),
          Container(
            color: Colors.white.withOpacity(.2),
            height: 100.h,
            width: 100.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocaleKeys.expand_your.tr
                  .text700(23.kh, textAlign: TextAlign.center),
              40.kheightBox,
              GhuyomButton(
                onPressed: () => controller.onLoginTap(),
                label: LocaleKeys.log_in.tr,
              ),
              15.kheightBox,
              GhuyomButton(
                color: ColorUtil.mainColorPink,
                onPressed: () {},
                label: LocaleKeys.continue_without_log_in.tr,
              ),
            ],
          ).paddingSymmetric(horizontal: 20.kw)
        ],
      ),
    );
  }
}
