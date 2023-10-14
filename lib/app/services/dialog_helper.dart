import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/responsive_size.dart';
import 'colors.dart';

class DialogHelper {
  static void showLoading([String? message]) {
    Get.dialog(
      WillPopScope(
        child: Center(
          child: Container(
              height: 80.kh,
              width: 80.kh,
              decoration: BoxDecoration(
                color: ColorUtil.mainColorBlue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0.kh),
                ),
              ),
              padding: EdgeInsets.all(12.kh),
              child: const Center(child: CircularProgressIndicator())),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  //hide loading
  static Future<void> hideDialog() async {
    if (Get.isDialogOpen!) Get.until((route) => !Get.isDialogOpen!);
  }
}
