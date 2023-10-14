import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ghuyom/app/modules/subscription/controllers/subscription_controller.dart';
import 'package:ghuyom/app/services/index.dart';
import '../../../components/ghuyom_appbar.dart';
import '../../../services/colors.dart';

class ChangePlan extends GetView<SubscriptionController> {
  const ChangePlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GhuyomAppbar(
        onPressed: () => {controller.radioGrpValue.value = 0, Get.back()},
        centerTitle: true,
        title: LocaleKeys.change_plan.tr,
      ),
      bottomNavigationBar: Padding(
        padding: paddingSymmetric(horizontal: 20.kw, vertical: 30.kh),
        child: Obx(
          () => GhuyomButton(
            onPressed: () {},
            isActive: controller.radioGrpValue.value == 0 ? false : true,
            label: LocaleKeys.change.tr,
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(
            height: 1.kh,
            thickness: 1.kh,
            color: const Color(0xffd9d9d9),
          ),
          40.kheightBox,
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LocaleKeys.your_plan.tr.text700(18.kh),
                17.kheightBox,
                GhuyomRoundedBox(
                    borderRadius: 16.kh,
                    borderColor: ColorUtil.mainColorBlue,
                    borderWidth: 2.kh,
                    isBorder: true,
                    child: Padding(
                        padding: paddingSymmetric(
                            horizontal: 28.kw, vertical: 18.kh),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              LocaleKeys.monthly_subscriptions.tr.text600(16.kh,
                                  color: ColorUtil.mainColorBlue),
                              10.kheightBox,
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: LocaleKeys.expiration_date.tr,
                                    style: TextStyleUtil.manrope500(
                                        fontSize: 14.kh)),
                                TextSpan(
                                    text: '24.05.2023',
                                    style: TextStyleUtil.manrope400(
                                        fontSize: 14.kh)),
                              ])),
                              4.kheightBox,
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: LocaleKeys.price.tr,
                                    style: TextStyleUtil.manrope500(
                                        fontSize: 14.kh)),
                                TextSpan(
                                    text: '109 ${LocaleKeys.qatari.tr}',
                                    style: TextStyleUtil.manrope400(
                                        fontSize: 14.kh)),
                              ]))
                            ]))),
                10.kheightBox,
                GestureDetector(
                  onTap: () => controller.onSubscriptionDetailTap(),
                  child: Text(
                    LocaleKeys.subscription_details.tr,
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 16.kh,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1),
                  ),
                ),
                27.kheightBox,
                LocaleKeys.change_to.tr.text700(18.kh),
                17.kheightBox,
                Obx(
                  () => GhuyomRoundedBox(
                      onTap: () => controller.onRadioTap(1),
                      isBorder: true,
                      borderWidth:
                          controller.radioGrpValue.value == 1 ? 2.kh : 1.kh,
                      borderRadius: 16.kh,
                      borderColor: controller.radioGrpValue.value == 1
                          ? ColorUtil.mainColorGreen
                          : const Color(0xffd9d9d9),
                      child: Padding(
                        padding: paddingOnly(
                            left: 30.kw,
                            top: 15.kh,
                            bottom: 15.kh,
                            right: 20.kw),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LocaleKeys.annual.tr.text600(16.kh),
                                4.kheightBox,
                                LocaleKeys.days_free.tr.text500(14.kh,
                                    color: ColorUtil.mainColorGreen),
                                4.kheightBox,
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: '1308',
                                      style: TextStyle(
                                          fontFamily: 'Manrope',
                                          color: Colors.black,
                                          fontSize: 14.kh,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.red,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          decorationThickness: 4)),
                                  TextSpan(
                                      text: ' ${LocaleKeys.save_20.tr}',
                                      style: TextStyleUtil.manrope500(
                                          fontSize: 14.kh,
                                          color: ColorUtil.mainColorBlue)),
                                ])),
                                4.kheightBox,
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: '1045 ',
                                      style: TextStyleUtil.manrope500(
                                          fontSize: 16.kh)),
                                  TextSpan(
                                      text: LocaleKeys.qatari_yr.tr,
                                      style: TextStyleUtil.manrope400(
                                          fontSize: 16.kh,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                ]))
                              ],
                            ),
                            const Spacer(),
                            Transform.scale(
                              scale: 1.2,
                              child: Radio(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                fillColor: MaterialStateProperty.all(
                                    ColorUtil.mainColorGreen),
                                value: 1,
                                groupValue: controller.radioGrpValue.value,
                                onChanged: (value) =>
                                    controller.onRadioTap(value ?? 0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                22.kheightBox,
                LocaleKeys.you_can_cancel.tr.text600(14.kh)
              ],
            ),
          )
        ],
      ),
    );
  }
}
