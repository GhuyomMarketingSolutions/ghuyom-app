import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/components/ghuyom_rounded_box.dart';
import 'package:ghuyom/app/modules/login/views/email.dart';
import 'package:ghuyom/app/modules/login/views/phone_number.dart';
import 'package:ghuyom/app/services/responsive_size.dart';
import 'package:ghuyom/generated/locales.g.dart';

import '../../../services/text_style_util.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            82.kheightBox,
            LocaleKeys.log_in.tr.text600(30.kh),
            35.kheightBox,
            LocaleKeys.log_in_with.tr
                .text400(16.kh, color: Colors.black.withOpacity(0.7)),
            22.kheightBox,
            DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: const Color(0xff707070).withOpacity(0.1),
                      // color: Colors.black,
                      offset: const Offset(0, -2)),
                ],
              ),
              child: GhuyomRoundedBox(
                color: const Color(0xffEDEEEF),
                height: 37.kh,
                child: Padding(
                  padding: EdgeInsets.all(5.kh),
                  child: TabBar(
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.kh),
                        color: Colors.white,
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      controller: controller.tabController,
                      labelStyle: TextStyleUtil.manrope500(fontSize: 14.kh),
                      unselectedLabelStyle:
                          TextStyleUtil.manrope500(fontSize: 14.kh),
                      tabs: [
                        Tab(text: LocaleKeys.phone_number.tr),
                        Tab(
                          text: LocaleKeys.email.tr,
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: controller.tabController,
                  children: const [PhoneNumber(), Email()]),
            ),
          ],
        ).paddingAll(20.kh));
  }
}
