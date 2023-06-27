import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            40.kheightBox,
            Expanded(
              child: Center(
                child: Padding(
                  padding: 20.paddingHorizontal,
                  child: GhuyomRoundedBox(
                      borderRadius: 16.kh,
                      isBorder: true,
                      borderColor: const Color(0xffD9D9D9),
                      borderWidth: 1.kh,
                      child: Padding(
                        padding: paddingSymmetric(
                            horizontal: 20.kw, vertical: 28.kh),
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
                              onPressed: () =>
                                  controller.onAddYourBusinessTap(),
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
            )
          ],
        ));
  }
}
