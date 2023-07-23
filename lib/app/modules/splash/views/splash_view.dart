import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/components/common_image_view.dart';
import 'package:ghuyom/app/constants/image_constant.dart';
import 'package:ghuyom/app/services/responsive_size.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

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
            imagePath: ImageConstant.pngSplashBg,
          ),
          Hero(
            tag: 'logo',
            child: CommonImageView(
              // height: 50,
              imagePath: ImageConstant.svgGhuyomLogo,
            ),
          ),
        ],
      ),
    );
  }
}
