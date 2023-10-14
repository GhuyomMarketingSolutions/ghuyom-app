import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ghuyom/app/services/colors.dart';

import 'package:ghuyom/app/services/index.dart';

import '../../../components/ghuyom_appbar.dart';

class SubscriptionDetail extends StatelessWidget {
  const SubscriptionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GhuyomAppbar(
        centerTitle: true,
        title: LocaleKeys.subscription_details.tr,
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
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LocaleKeys.monthly_subscriptions.tr
                      .text700(16.kh, color: ColorUtil.mainColorBlue),
                  20.kheightBox,
                  textBullet(LocaleKeys.access_to_all.tr),
                  textBullet(LocaleKeys.option_to_cancel.tr),
                  textBullet(LocaleKeys.increased_visibility_for.tr),
                  textBullet(LocaleKeys.marketing_opportunities.tr),
                  textBullet(LocaleKeys.priority_customer.tr),
                  20.kheightBox,
                  LocaleKeys.yearly_subscriptions.tr
                      .text700(16.kh, color: ColorUtil.mainColorBlue),
                  20.kheightBox,
                  textBullet(LocaleKeys.all_benefits_of.tr),
                  textBullet(LocaleKeys.discounted_pricing.tr),
                  textBullet(LocaleKeys.access_to.tr),
                  textBullet(LocaleKeys.opportunity_to.tr),
                  textBullet(LocaleKeys.increased_chances.tr),
                ]),
          )
        ],
      ),
    );
  }

  textBullet(String text) {
    return Row(
      children: [const Text('⚈'), 10.kwidthBox, Expanded(child: text.text400(14.kh))],
    );
  }
}
