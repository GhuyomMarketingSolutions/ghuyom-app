import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/modules/add_service/views/add_service.dart';

import '../../../services/colors.dart';
import '../../../services/index.dart';
import '../controllers/add_service_controller.dart';

class AddServiceView extends GetView<AddServiceController> {
  const AddServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(controller.businessId);
    return Scaffold(
        bottomNavigationBar: GhuyomButton(
          onPressed: () => controller.onServicePageDone(),
          label: LocaleKeys.done.tr,
        ).paddingOnly(left: 20.kw, right: 20.kw, bottom: 30.kh),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            52.kheightBox,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GhuyomRoundedBox(
                        height: 40.kh,
                        width: 40.kh,
                        isBorder: true,
                        borderColor: const Color(0xffD8DADC),
                        borderRadius: 10.kh,
                        borderWidth: 1.kh,
                        onTap: () => controller.onServicePageDone(),
                        child: Center(
                          child: CommonImageView(
                            height: 15.kh,
                            width: 9.kh,
                            svgPath: ImageConstant.svgBack,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: LocaleKeys.add_your_services.tr
                      .text600(18.kh, textAlign: TextAlign.center),
                ),
                const Expanded(flex: 2, child: Row())
              ],
            ),
            30.kheightBox,
            Obx(
              () => ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: controller.services.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => controller.onDeleteBusinessTap(index),
                            child: LocaleKeys.delete.tr
                                .text400(14.kh, color: ColorUtil.red),
                          ),
                        ),
                        8.kheightBox,
                        DecoratedBox(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.5, 0.5),
                              blurRadius: 20.0,
                              spreadRadius: .50,
                            ),
                          ]),
                          child: GhuyomRoundedBox(
                              child: Row(
                            children: [
                              GhuyomRoundedBox(
                                color: Colors.grey,
                                height: 90.kh,
                                width: 99.kw,
                                child: CommonImageView(
                                    url: controller.services[index].image),
                              ),
                              25.kwidthBox,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: controller.services[index].name
                                              .toString()
                                              .text500(16.kh),
                                        ),
                                        '\$ ${controller.services[index].price}'
                                            .text600(16.kh,
                                                color: ColorUtil.mainColorGreen)
                                      ],
                                    ),
                                    8.kheightBox,
                                    controller.services[index].description
                                        .toString()
                                        .text400(10.kh, color: ColorUtil.grey)
                                  ],
                                ),
                              )
                            ],
                          ).paddingAll(11.kh)),
                        ),
                        30.kheightBox,
                      ],
                    );
                  }),
            ),
            30.kheightBox,
            Align(
              alignment: Alignment.centerLeft,
              child: GhuyomButton(
                isBorder: true,
                color: Colors.white,
                onPressed: () => Get.to(() => const AddService()),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    LocaleKeys.add_service.tr
                        .text600(16.kh, color: Colors.black)
                  ],
                ),
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 20.kw));
  }
}
