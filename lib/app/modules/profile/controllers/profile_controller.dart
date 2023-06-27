import 'package:get/get.dart';
import 'package:ghuyom/app/constants/image_constant.dart';
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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

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
      case 0:
        {
          print('object');
        }
        break;
      case 0:
        {
          print('object');
        }
        break;
      case 0:
        {
          print('object');
        }
        break;
      default:
    }
  }

  onLogoutTap() {
    Get.find<AuthService>().logOutUser();
  }
}
