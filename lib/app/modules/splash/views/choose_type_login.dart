import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:ghuyom/app/modules/splash/controllers/splash_controller.dart';
import 'package:ghuyom/app/services/colors.dart';
import 'package:ghuyom/app/services/index.dart';

class ChooseTypeLogin extends GetView<SplashController> {
  const ChooseTypeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

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
            color: Colors.white.withOpacity(.3),
            height: 100.h,
            width: 100.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Hero(
                    tag: 'logo',
                    child: CommonImageView(
                      // height: 50,
                      imagePath: ImageConstant.svgGhuyomLogo,
                    ),
                  ),
                ),
              ),
              LocaleKeys.change_to_boost.tr
                  .text700(23.kh, textAlign: TextAlign.center),
              40.kheightBox,
              GhuyomButton(
                onPressed: () => controller.onJoinTap(),
                label: LocaleKeys.join_as_business.tr,
              ),
              15.kheightBox,
              GhuyomButton(
                onPressed: () => controller.onLoginTap(),
                label: LocaleKeys.business_login.tr,
              ),
              15.kheightBox,
              GhuyomButton(
                color: ColorUtil.mainColorPink,
                onPressed: () => controller.onGuestTap(),
                label: LocaleKeys.browse_as_guest.tr,
              ),
              50.kheightBox,
            ],
          ).paddingSymmetric(horizontal: 20.kw)
        ],
      ),
    );
  }
}
