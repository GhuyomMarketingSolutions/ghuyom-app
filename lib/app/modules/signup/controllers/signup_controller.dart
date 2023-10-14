import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/modules/signup/views/signup_phone.dart';
import 'package:ghuyom/app/services/auth.dart';
import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isButtonActive = false.obs;
  RxBool isPhoneButtonActive = false.obs;
  RxBool isObscure = true.obs;

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

  emailValidator(String? value) {
    if (!(value?.isEmail ?? true)) {
      return LocaleKeys.please_enter_email.tr;
    }
  }

  passwordValidator(String? value) {
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value ?? "")) {
      return LocaleKeys.minimum_eight_characters.tr;
    }
  }

  confirmPassValidator(String? value) {
    if (passController.text != confirmPassController.text) {
      return LocaleKeys.password_do_not_match.tr;
    }
  }

  onNumberChange(String value) {
    if (value.length == 8) {
      isPhoneButtonActive.value = true;
    } else {
      isPhoneButtonActive.value = false;
    }
  }

  onFormChange() {
    if (emailController.text != '' &&
        passController.text != '' &&
        confirmPassController.text != '') {
      isButtonActive.value = true;
    } else {
      isButtonActive.value = false;
    }
  }

  onLoginTap() async {
    Get.toNamed(Routes.LOGIN);
  }

  onContinueTap() async {
    if (formKey.currentState!.validate() &&
        await Get.find<AuthService>().createEmailPass(
            email: emailController.text, pass: confirmPassController.text)) {
      Get.to(() => const SignUpPhone());
    }
    // if (isButtonActive.value &&
    //     await Get.find<AuthService>()
    //         .mobileOtp(phoneno: '+91${phoneController.text}')) {
    //   Get.toNamed(Routes.OTP, arguments: ['+91${phoneController.text}']);
    // }
  }

  onPhoneContinueTap() async {
    if (await Get.find<AuthService>()
        .mobileOtp(phoneno: '+974${phoneController.text}')) {
      Get.toNamed(Routes.OTP, parameters: {
        'phone': '+91${phoneController.text}',
        'newAccount': 'newAccount'
      });
    }
  }
}
