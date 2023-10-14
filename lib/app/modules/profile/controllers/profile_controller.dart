import 'package:get/get.dart';
import 'package:ghuyom/app/constants/image_constant.dart';
import 'package:ghuyom/app/modules/profile/views/privacy_policy.dart';
import 'package:ghuyom/app/services/auth.dart';
import 'package:ghuyom/generated/locales.g.dart';

import '../../../routes/app_pages.dart';

import '../views/terms.dart';

class ProfileController extends GetxController {
  List<Map<String, String>> data = [
    {'icon': ImageConstant.svgAccount, 'label': LocaleKeys.account_settings.tr},
    // {
    //   'icon': ImageConstant.svgSubscription,
    //   'label': LocaleKeys.subscription.tr
    // },
    // {'icon': ImageConstant.svgPayment, 'label': LocaleKeys.payment.tr},
    {'icon': ImageConstant.svgTerms, 'label': LocaleKeys.terms_of_use.tr},
    {'icon': ImageConstant.svgPrivacy, 'label': LocaleKeys.privacy_policy.tr},
  ];

  List<String> terms = [
    'Information Collection: We collect personal information from users when they create an account, make a payment, leave a review or rating, or contact our customer service team. This may include name, email address, billing information, and demographic information.',
    'Information Use: We use the information collected to provide our services, communicate with users about their accounts, and improve our platform. We may also use the information to send promotional emails or offers from our partners.',
    'Information Sharing: We do not share personal information with third-party advertisers or marketing companies. We may share information with service providers who help us operate our platform, process payments, or provide customer support.',
    'Payment Information: We use third-party payment processors to handle payments. We do not store or have access to user\'s payment information.',
    'Security: We take reasonable steps to protect user information, but we cannot guarantee its absolute security. Users are responsible for protecting their account information and passwords.',
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
        Get.toNamed(Routes.ACCOUNT_SETTINGS);
        break;
      // case 1:
      //   Get.toNamed(Routes.SUBSCRIPTION);
      //   break;
      // case 1:
      //   Get.to(() => const Paypal());
      //   break;
      case 1:
        Get.to(() => const Terms());
        break;
      case 2:
        Get.to(() => const PrivacyPolicy());
        break;
      default:
    }
  }

  onLogoutTap() async => await Get.find<AuthService>().logOutUser();
}
