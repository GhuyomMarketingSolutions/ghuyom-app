import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/services/colors.dart';

import 'package:ghuyom/app/services/index.dart';

import '../../../components/ghuyom_appbar.dart';
import '../controllers/business_controller.dart';

class BusinessView extends GetView<BusinessController> {
  const BusinessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GhuyomAppbar(
          isLeading: false,
          centerTitle: true,
          title: LocaleKeys.my_businesses.tr,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              height: 1.kh,
              thickness: 1.kh,
              color: const Color(0xffd9d9d9),
            ),
            25.kheightBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GhuyomButton(
                      borderRadius: 12.kh,
                      onPressed: () => controller.onAddYourBusinessTap(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.add),
                          LocaleKeys.add_your.tr
                              .text600(16.kh, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  25.kheightBox,
                  LocaleKeys.added_businesses.tr.text600(18.kh),
                  20.kheightBox,
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                          itemCount: controller.businesses.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          controller.onEditTap(context),
                                      child: Row(
                                        children: [
                                          CommonImageView(
                                            svgPath: ImageConstant.svgEdit,
                                            height: 16.kh,
                                            width: 16.kh,
                                          ),
                                          4.kwidthBox,
                                          LocaleKeys.edit.tr.text400(14.kh,
                                              color: ColorUtil.mainColorGreen),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () =>
                                          controller.onDeleteBusinessTap(index),
                                      child: LocaleKeys.delete.tr
                                          .text400(14.kh, color: ColorUtil.red),
                                    )
                                  ],
                                ),
                                8.kheightBox,
                                DecoratedBox(
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
                                    // onTap: () => controller.onListedBusinessTap(),
                                    height: 95.kh,
                                    borderRadius: 5.kh,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.kh),
                                            bottomLeft: Radius.circular(8.kh),
                                          ),
                                          child: CommonImageView(
                                              width: 120.kw,
                                              height: 95.kh,
                                              fit: BoxFit.cover,
                                              url: controller.businesses[index]
                                                  .images?[0]),
                                        ),
                                        Expanded(
                                          // flex: 6,
                                          child: Container(
                                            color: Colors.white,
                                            // padding: paddingSymmetric(horizontal: 12.kw, vertical: 4.kh),
                                            padding: paddingOnly(
                                                left: 12.kw,
                                                right: 12.kw,
                                                top: 4.kh,
                                                bottom: 4.kh),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                '${controller.businesses[index].name}'
                                                    .text600(14.kh),
                                                '${controller.businesses[index].category}'
                                                    .text500(10.kh,
                                                        color: ColorUtil
                                                            .mainColorBlue),
                                                4.kheightBox,
                                                '${controller.businesses[index].description}'
                                                    .text400(8.kh),
                                                5.kheightBox,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CommonImageView(
                                                      height: 14.kh,
                                                      width: 14.kh,
                                                      svgPath: ImageConstant
                                                          .svgMapPin,
                                                    ),
                                                    3.kwidthBox,
                                                    Expanded(
                                                      child:
                                                          '${controller.businesses[index].address}'
                                                              .text500(10.kh,
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    color: ColorUtil
                                                                        .mainColorPink,
                                                                    fontSize:
                                                                        10.kh,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  )),
                                                    )
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
                              ],
                            ).paddingOnly(bottom: 16.kh);
                          }),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.kw),
            ),
          ],
        ));
  }

  Widget addBusiness() {
    return Expanded(
      child: Center(
        child: Padding(
          padding: 20.paddingHorizontal,
          child: GhuyomRoundedBox(
              borderRadius: 16.kh,
              isBorder: true,
              borderColor: const Color(0xffD9D9D9),
              borderWidth: 1.kh,
              child: Padding(
                padding: paddingSymmetric(horizontal: 20.kw, vertical: 28.kh),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LocaleKeys.you_havent_added.tr
                        .text800(18.kh, textAlign: TextAlign.center),
                    13.kheightBox,
                    LocaleKeys.add_your_business.tr.text500(14.kh,
                        color: const Color(0xff464646),
                        textAlign: TextAlign.center),
                    30.kheightBox,
                    GhuyomButton(
                      borderRadius: 12.kh,
                      onPressed: () => controller.onAddYourBusinessTap(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.add),
                          LocaleKeys.add_your.tr
                              .text600(16.kh, color: Colors.white)
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
