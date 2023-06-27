import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/modules/subscription/views/change_plan.dart';
import 'package:ghuyom/app/modules/subscription/views/subscription_detail.dart';
import 'package:ghuyom/app/services/colors.dart';
import 'package:ghuyom/app/services/index.dart';

class SubscriptionController extends GetxController {
  RxInt radioGrpValue = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onRadioTap(int value) {
    radioGrpValue.value = value;
  }

  onSubscriptionDetailTap() {
    Get.to(() => const SubscriptionDetail());
  }

  onCancelSubscriptionTap() {
    Get.dialog(
        Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.kw),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.kh)),
          child: GhuyomRoundedBox(
              isBorder: true,
              borderWidth: 1.kh,
              borderColor: const Color(0xffD9D9D9),
              child: Padding(
                padding: paddingSymmetric(horizontal: 50.kw, vertical: 25.kh),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LocaleKeys.are_you_sure.tr
                        .text600(16.kh, textAlign: TextAlign.center),
                    23.kheightBox,
                    GhuyomButton(
                      label: LocaleKeys.keep_plan.tr,
                      labelColor: ColorUtil.mainColorBlue,
                      onPressed: () => Get.back(),
                      borderRadius: 20.kh,
                      isBorder: true,
                      borderColor: ColorUtil.mainColorBlue,
                      borderWidth: 1.kh,
                      color: Colors.white,
                    ),
                    10.kheightBox,
                    GhuyomButton(
                      label: LocaleKeys.cancel_subscription.tr,
                      onPressed: () => Get.back(),
                      borderRadius: 20.kh,
                      color: Colors.red,
                    ),
                  ],
                ),
              )),
        ),
        barrierColor: Colors.white.withOpacity(0.66),
        barrierDismissible: false);
  }

  onChangePlanTap() {
    Get.to(() => const ChangePlan());
  }
}
