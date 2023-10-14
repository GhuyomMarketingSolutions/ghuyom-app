import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../services/colors.dart';
import '../controllers/business_detail_controller.dart';

class BusinessDetailView extends GetView<BusinessDetailController> {
  const BusinessDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(builder: (BusinessDetailController controller) {
      return Obx(
        () => ListView(
          padding: EdgeInsets.zero,
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
                      child: (controller.business.value?.business?.category ??
                              '--')
                          .text600(18.kh, textAlign: TextAlign.center)),
                  const Expanded(flex: 2, child: Row())
                ],
              ),
            ),
            18.kheightBox,
            Padding(
              padding: 20.paddingHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GhuyomRoundedBox(
                    height: 178.kh,
                    borderRadius: 5.kh,
                    child: Stack(
                      // alignment: Alignment.topRight,
                      children: [
                        PageView(
                          controller: controller.pageViewController,
                          children: List.generate(
                              controller.business.value?.business?.images
                                      ?.length ??
                                  0,
                              (index) => CommonImageView(
                                    url: controller.business.value?.business
                                            ?.images?[index] ??
                                        '',
                                    fit: BoxFit.cover,
                                  )),
                        ),
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: Padding(
                        //     padding: paddingOnly(top: 7.kh, right: 12.kw),
                        //     child: GhuyomRoundedBox(
                        //       onTap: () => controller.onHeartTap(),
                        //       borderRadius: 100,
                        //       child: Padding(
                        //         padding: 5.paddingAll,
                        //         child: Obx(
                        //           () => CommonImageView(
                        //             height: 24.kh,
                        //             width: 24.kh,
                        //             svgPath: controller.isHeart.value
                        //                 ? ImageConstant.svgHeartOn
                        //                 : ImageConstant.svgHeartOff,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        if (controller.business.value != null)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: 6.paddingBottom,
                              child: GhuyomRoundedBox(
                                borderRadius: 5.kh,
                                color: const Color(0xffEDEDED).withOpacity(0.8),
                                child: Padding(
                                  padding: paddingSymmetric(
                                      horizontal: 8.kw, vertical: 4.kh),
                                  child: SmoothPageIndicator(
                                    controller: controller
                                        .pageViewController, // PageController
                                    count: controller.business.value?.business
                                            ?.images?.length ??
                                        0,
                                    effect: ExpandingDotsEffect(
                                        activeDotColor: ColorUtil.mainColorPink,
                                        dotHeight: 6.kh,
                                        spacing: 2.kw,
                                        dotWidth: 6.kh,
                                        expansionFactor:
                                            1.1), // your preferred effect
                                    onDotClicked: (index) {},
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  10.kheightBox,
                  (controller.business.value?.business?.name ?? '--')
                      .text600(18.kh),
                  3.kheightBox,
                  Row(
                    children: [
                      (controller.business.value?.business?.category ?? '--')
                          .text600(16.kh, color: ColorUtil.mainColorBlue),
                      if (controller.business.value?.business!.subCategory
                              ?.isNotEmpty ??
                          false)
                        Padding(
                          padding: 7.paddingHorizontal,
                          child: CircleAvatar(
                              backgroundColor: const Color(0xffD9D9D9),
                              radius: 3.kh),
                        ),
                      (controller.business.value?.business?.subCategory ?? '--')
                          .text500(16.kh, color: const Color(0xff676767)),
                    ],
                  ),
                  8.kheightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonImageView(
                        height: 16.kh,
                        width: 16.kh,
                        svgPath: ImageConstant.svgMapPin,
                      ),
                      5.kwidthBox,
                      if (controller.business.value != null)
                        Expanded(
                            child:
                                '${controller.business.value?.business?.address} - ${controller.calculateDistance(controller.business.value?.business?.location?.coordinates?[1], controller.business.value?.business?.location?.coordinates?[0]).toStringAsFixed(2)} km from me'
                                    .text500(14.kh,
                                        color: ColorUtil.mainColorPink))
                    ],
                  ),
                  16.kheightBox,
                  Row(
                    children: [
                      if (controller.business.value?.business?.instagram
                              ?.isNotEmpty ??
                          false)
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () => controller.onLinkTap(
                              controller.business.value?.business?.instagram),
                          child: Column(
                            children: [
                              CommonImageView(
                                  height: 24.kh,
                                  width: 24.kh,
                                  svgPath: ImageConstant.svgInstagram),
                              2.kheightBox,
                              LocaleKeys.instagram.tr.text400(14.kh)
                            ],
                          ).paddingOnly(right: 30.kw),
                        ),
                      if (controller
                              .business.value?.business?.website?.isNotEmpty ??
                          false)
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () => controller.onLinkTap(
                              controller.business.value?.business?.website),
                          child: Column(
                            children: [
                              CommonImageView(
                                height: 24.kh,
                                width: 24.kh,
                                svgPath: ImageConstant.svgWeb,
                              ),
                              2.kheightBox,
                              LocaleKeys.website.tr.text400(14.kh)
                            ],
                          ).paddingOnly(right: 30.kw),
                        ),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () => controller.onDirectionsTap(controller
                                .business
                                .value
                                ?.business
                                ?.location
                                ?.coordinates ??
                            [0, 0]),
                        child: Column(
                          children: [
                            CommonImageView(
                                height: 24.kh,
                                width: 24.kh,
                                svgPath: ImageConstant.svgShare,
                                svgColor: ColorUtil.mainColorBlue),
                            2.kheightBox,
                            LocaleKeys.directions.tr.text400(14.kh)
                          ],
                        ),
                      ),
                    ],
                  ),
                  18.kheightBox,
                  LocaleKeys.about.tr.text600(16.kh),
                  4.kheightBox,
                  (controller.business.value?.business?.description ?? '--')
                      .text400(12.kh),
                  18.kheightBox,
                  if (controller.business.value?.services?.isNotEmpty ?? false)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LocaleKeys.services.tr.text600(16.kh),
                          4.kheightBox,
                          ...List.generate(
                              controller.business.value?.services?.length ?? 0,
                              (index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(8, 5),
                                      blurRadius: 15,
                                      spreadRadius: 0),
                                ],
                              ),
                              child: GhuyomRoundedBox(
                                  child: Padding(
                                padding: EdgeInsets.all(12.kh),
                                child: Row(
                                  children: [
                                    GhuyomRoundedBox(
                                        height: 90.kh,
                                        width: 99.kw,
                                        child: CommonImageView(
                                          url: controller.business.value
                                              ?.services?[index].image,
                                        )),
                                    10.kwidthBox,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: (controller
                                                            .business
                                                            .value
                                                            ?.services?[index]
                                                            .name ??
                                                        '--')
                                                    .text500(16.kh),
                                              ),
                                              const Spacer(),
                                              '\$ ${controller.business.value?.services?[index].price ?? '--'}'
                                                  .text500(16.kh,
                                                      color: const Color(
                                                          0xff94C180)),
                                            ],
                                          ),
                                          8.kheightBox,
                                          (controller
                                                      .business
                                                      .value
                                                      ?.services?[index]
                                                      .description ??
                                                  '--')
                                              .text400(10.kh)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                            );
                          }),
                        ]),

                  28.kheightBox,
                  LocaleKeys.working_hours.tr
                      .text600(14.kh, color: ColorUtil.mainColorBlue),
                  20.kheightBox,
                  // Row(children: [
                  //   LocaleKeys.Monday.tr.text400(14.kh),
                  //   70.kwidthBox,

                  //   '${controller.business.value?.business?.workingHours?.days}'
                  //       .text400(14.kh)
                  // ]),
                  // 10.kheightBox,
                  // Row(
                  //   children: [
                  //     'Monday'.text400(14.kh),
                  //     70.kwidthBox,
                  //     'Open 24 hours'
                  //         .text400(14.kh, color: const Color(0xff94C180)),
                  //   ],
                  // ),
                  // 10.kheightBox,
                  // Row(
                  //   children: [
                  //     'Monday'.text400(14.kh),
                  //     70.kwidthBox,
                  //     'Closed'.text400(14.kh, color: const Color(0xffF54135)),
                  //   ],
                  // ),
                  !(controller.business.value?.business?.workingHours
                              ?.isClosed ??
                          true)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                              Obx(
                                () => Row(
                                  children: List.generate(
                                      controller.days.length, (index) {
                                    return Row(
                                      children: [
                                        controller.daysBool[index] == true
                                            ? GhuyomRoundedBox(
                                                height: 30.kh,
                                                width: 30.kh,
                                                borderRadius: 100,
                                                color: ColorUtil.mainColorPink,
                                                child: Center(
                                                  child: controller.days[index]
                                                      .text400(16.kh),
                                                ))
                                            : GhuyomRoundedBox(
                                                isBorder: true,
                                                borderWidth: 1.kh,
                                                borderColor:
                                                    const Color(0xffC4C4C4),
                                                height: 30.kh,
                                                width: 30.kh,
                                                borderRadius: 100,
                                                child: Center(
                                                  child: controller.days[index]
                                                      .text400(16.kh,
                                                          color: const Color(
                                                              0xffC4C4C4)),
                                                )),
                                        5.kwidthBox
                                      ],
                                    );
                                  }),
                                ),
                              ),
                              10.kheightBox,
                              if (controller.business.value?.business
                                      ?.workingHours?.isOpen24Hours ??
                                  false)
                                'Open 24 hours'.text400(14.kh,
                                    color: const Color(0xff94C180)),
                              10.kheightBox,
                              Row(
                                children: [
                                  'Open time'.text400(14.kh),
                                  70.kwidthBox,
                                  (controller.business.value?.business
                                              ?.workingHours?.startTime ??
                                          '--')
                                      .text400(14.kh,
                                          color: ColorUtil.mainColorGreen),
                                ],
                              ),
                              10.kheightBox,
                              Row(
                                children: [
                                  'Close time'.text400(14.kh),
                                  70.kwidthBox,
                                  (controller.business.value?.business
                                              ?.workingHours?.endTime ??
                                          '--')
                                      .text400(14.kh, color: ColorUtil.red),
                                ],
                              ),
                            ])
                      : 'Closed Now'.text400(14.kh, color: ColorUtil.red),

                  25.kheightBox,
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
