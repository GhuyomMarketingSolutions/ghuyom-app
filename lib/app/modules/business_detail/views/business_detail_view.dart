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
        18.kheightBox,
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
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
                          children: [
                            Container(
                              color: Colors.red,
                              height: 178.kh,
                            ),
                            Container(
                              color: Colors.green,
                              height: 178.kh,
                            ),
                            Container(
                              color: Colors.blue,
                              height: 178.kh,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: paddingOnly(top: 7.kh, right: 12.kw),
                            child: GhuyomRoundedBox(
                              onTap: () => controller.onHeartTap(),
                              borderRadius: 100,
                              child: Padding(
                                padding: 5.paddingAll,
                                child: Obx(
                                  () => CommonImageView(
                                    height: 24.kh,
                                    width: 24.kh,
                                    svgPath: controller.isHeart.value
                                        ? ImageConstant.svgHeartOn
                                        : ImageConstant.svgHeartOff,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                                  count: 3,
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
                  'Jan Amore'.text600(18.kh),
                  3.kheightBox,
                  Row(
                    children: [
                      LocaleKeys.restaurants.tr
                          .text600(16.kh, color: ColorUtil.mainColorBlue),
                      Padding(
                        padding: 7.paddingHorizontal,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffD9D9D9),
                          radius: 3.kh,
                        ),
                      ),
                      'Italian Food'
                          .text500(16.kh, color: const Color(0xff676767)),
                    ],
                  ),
                  Row(
                    children: [
                      CommonImageView(
                        height: 16.kh,
                        width: 16.kh,
                        svgPath: ImageConstant.svgMapPin,
                      ),
                      1.kwidthBox,
                      'Jakarta Blvd, 23 - 3 km from me'
                          .text500(14.kh, color: ColorUtil.mainColorPink)
                    ],
                  ),
                  16.kheightBox,
                  Row(
                    children: [
                      Column(
                        children: [
                          CommonImageView(
                            height: 24.kh,
                            width: 24.kh,
                            svgPath: ImageConstant.svgInstagram,
                          ),
                          2.kheightBox,
                          LocaleKeys.instagram.tr.text400(14.kh)
                        ],
                      ),
                      30.kwidthBox,
                      Column(
                        children: [
                          CommonImageView(
                            height: 24.kh,
                            width: 24.kh,
                            svgPath: ImageConstant.svgWeb,
                          ),
                          2.kheightBox,
                          LocaleKeys.website.tr.text400(14.kh)
                        ],
                      ),
                    ],
                  ),
                  18.kheightBox,
                  LocaleKeys.about.tr.text600(16.kh),
                  4.kheightBox,
                  'Welcome to our Italian restaurant, where we offer an authentic taste of Italy right in the heart of the city. From the moment you step through our doors, you\'ll be transported to the streets of Rome with our cozy, warm atmosphere and friendly staff.'
                      .text400(12.kh),
                  18.kheightBox,
                  LocaleKeys.services.tr.text600(16.kh),
                  4.kheightBox,
                  DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(8, 5),
                          blurRadius: 15,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: GhuyomRoundedBox(
                        child: Padding(
                      padding: EdgeInsets.all(12.kh),
                      child: Row(
                        children: [
                          GhuyomRoundedBox(
                              color: Colors.green,
                              height: 90.kh,
                              width: 99.kw,
                              child: Container()),
                          25.kwidthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    'Italian Dinner'.text500(16.kh),
                                    const Spacer(),
                                    '\$ 50'.text500(16.kh,
                                        color: const Color(0xff94C180)),
                                  ],
                                ),
                                8.kheightBox,
                                'Our menu is inspired by the rich culinary heritage of Italy, and we offer a wide selection of dishes that are sure to satisfy any appetite.'
                                    .text400(10.kh)
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                  28.kheightBox,
                  LocaleKeys.working_hours.tr
                      .text600(14.kh, color: ColorUtil.mainColorBlue),
                  20.kheightBox,
                  Column(
                    children: List.generate(3, (index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              'Monday'.text400(14.kh),
                              70.kwidthBox,
                              '11:30-21:30'.text400(14.kh),
                            ],
                          ),
                          10.kheightBox,
                        ],
                      );
                    }),
                  ),
                  Row(
                    children: [
                      'Monday'.text400(14.kh),
                      70.kwidthBox,
                      'Open 24 hours'.text400(14.kh, color: Color(0xff94C180)),
                    ],
                  ),
                  10.kheightBox,
                  Row(
                    children: [
                      'Monday'.text400(14.kh),
                      70.kwidthBox,
                      'Closed'.text400(14.kh, color: Color(0xffF54135)),
                    ],
                  ),
                  25.kheightBox,
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
