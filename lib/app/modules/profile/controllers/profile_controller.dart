import 'package:get/get.dart';
import 'package:ghuyom/app/constants/image_constant.dart';
import 'package:ghuyom/app/modules/profile/views/privacy_policy.dart';
import 'package:ghuyom/app/services/auth.dart';
import 'package:ghuyom/generated/locales.g.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  List<Map<String, String>> data = [
    {'icon': ImageConstant.svgAccount, 'label': LocaleKeys.account_settings.tr},
    {
      'icon': ImageConstant.svgSubscription,
      'label': LocaleKeys.subscription.tr
    },
    {'icon': ImageConstant.svgPayment, 'label': LocaleKeys.payment.tr},
    {'icon': ImageConstant.svgTerms, 'label': LocaleKeys.terms_of_use.tr},
    {'icon': ImageConstant.svgPrivacy, 'label': LocaleKeys.privacy_policy.tr},
  ];

  List<String> privacy = [
    'User Conduct: Users are responsible for their own conduct on the platform. This includes complying with all applicable laws and regulations, not engaging in fraud or abusive behavior, and not posting content that is illegal, obscene, or infringes on other\'s rights.',
    'User Content: Users retain ownership of the content they post on the platform, but grant us a license to use, modify, or distribute the content for promotional or other purposes.',
    'Platform Use: We reserve the right to modify, suspend, or terminate the platform at any time, with or without notice. We may also change the terms of use at any time.',
    'Limitation of Liability: We are not liable for any damages or losses resulting from user\'s use of the platform, including any errors or interruptions in service.'
        'Dispute Resolution: Any disputes arising from the use of the platform will be resolved through binding arbitration in accordance with the rules of the American Arbitration Association.'
  ];

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onListElementTap(int index) {
    switch (index) {
      case 0:
        {
          Get.toNamed(Routes.ACCOUNT_SETTINGS);
        }
        break;
      case 1:
        {
          Get.toNamed(Routes.SUBSCRIPTION);
        }
        break;
      case 2:
        {
          print('object');
        }
        break;
      case 3:
        {
          print('3');
        }
        break;
      case 4:
        Get.to(() => const PrivacyPolicy());
        break;
      default:
    }
  }

  onLogoutTap() {
    Get.find<AuthService>().logOutUser();
  }
}
