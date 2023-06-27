import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/services/index.dart';

import '../../../services/colors.dart';
import '../controllers/list_businesses_controller.dart';

class ListBusinessesView extends GetView<ListBusinessesController> {
  const ListBusinessesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: paddingOnly(left: 20.kw, right: 20.kw, top: 52.kh),
          child: Row(
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
                      onTap: () => Get.back(),
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
                child: Obx(() => controller.title.value
                    .text600(18.kh, textAlign: TextAlign.center)),
              ),
              Expanded(flex: 2, child: Row())
            ],
          ),
        ),
        17.kheightBox,
        Divider(
          height: 1.kh,
          color: const Color(0xffD9D9D9),
          thickness: 1.kh,
        ),
        Padding(
          padding: EdgeInsets.all(12.kh),
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 5),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: GhuyomRoundedBox(
              onTap: () => controller.onListedBusinessTap(),
              color: Colors.grey,
              borderRadius: 5.kh,
              child: Row(
                children: [
                  SizedBox(
                    width: 120.kw,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      // padding: paddingSymmetric(horizontal: 12.kw, vertical: 4.kh),
                      padding: paddingOnly(
                          left: 12.kw, right: 12.kw, top: 4.kh, bottom: 4.kh),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              'No Name'.text600(14.kh),
                              const Spacer(),
                              CommonImageView(
                                height: 16.kh,
                                width: 16.kh,
                                svgPath: ImageConstant.svgHeartOff,
                              )
                            ],
                          ),
                          LocaleKeys.restaurants.tr
                              .text500(10.kh, color: ColorUtil.mainColorBlue),
                          4.kheightBox,
                          'We offer professional haircuts for certain hair types or styles, such as textured hair or ...'
                              .text400(8.kh),
                          5.kheightBox,
                          Row(
                            children: [
                              CommonImageView(
                                height: 14.kh,
                                width: 14.kh,
                                svgPath: ImageConstant.svgMapPin,
                              ),
                              3.kwidthBox,
                              '500 m from me'.text500(10.kh,
                                  color: ColorUtil.mainColorPink)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
