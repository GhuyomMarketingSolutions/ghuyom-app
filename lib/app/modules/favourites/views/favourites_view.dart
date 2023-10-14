import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/components/ghuyom_appbar.dart';
import 'package:ghuyom/app/services/index.dart';

import '../../../services/colors.dart';
import '../controllers/favourites_controller.dart';

class FavouritesView extends GetView<FavouritesController> {
  const FavouritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GhuyomAppbar(
          centerTitle: true,
          isLeading: false,
          title: LocaleKeys.saved_places.tr,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              height: 1.kh,
              thickness: 1.kh,
              color: const Color(0xffd9d9d9),
            ),
            27.kheightBox,
            Padding(
              padding: 20.paddingHorizontal,
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
                              left: 12.kw,
                              right: 12.kw,
                              top: 4.kh,
                              bottom: 4.kh),
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
                              LocaleKeys.restaurants.tr.text500(10.kh,
                                  color: ColorUtil.mainColorBlue),
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
