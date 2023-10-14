import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ghuyom/app/services/snackbar.dart';
import 'package:ghuyom/app/services/storage.dart';

import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../routes/app_pages.dart';
import 'dialog_helper.dart';

class AuthService extends GetxService {
  final auth = FirebaseAuthenticationService();
  final _firebaseAuth = FirebaseAuth.instance;
  PhoneAuthCredential? phoneAuthCredential;

  String? _mobileVerificationId;

  changePasswordLink() async {
    await auth.sendResetPasswordLink(_firebaseAuth.currentUser!.email ?? '')
        ? showMySnackbar(msg: 'Password reset link sent successfully')
        : showMySnackbar(msg: 'Something went wrong');
  }

  Future<bool> loginAnonynously() async {
    bool status = false;
    DialogHelper.showLoading();

    await auth.loginAnonymously().then((value) async {
      if (!value.hasError) {
        status = true;
        await handleGetContact();
      }
      DialogHelper.hideDialog();
    });
    return status;
  }

  Future<bool> loginEmailPass(
      {required String email, required String pass}) async {
    bool status = false;
    await auth.loginWithEmail(email: email, password: pass).then((value) async {
      if (!value.hasError) {
        status = true;
        await handleGetContact();
      }
    });
    return status;
  }

  Future<bool> createEmailPass(
      {required String email, required String pass}) async {
    bool status = false;
    DialogHelper.showLoading();
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: pass,
      )
          .then((value) async {
        if (value.user != null) {
          status = true;
        }
      });
      DialogHelper.hideDialog();
      return status;
    } on FirebaseAuthException catch (e) {
      debugPrint('A firebase exception has occured. $e');
      FirebaseAuthenticationResult.error(
          exceptionCode: e.code.toLowerCase(),
          errorMessage: getErrorMessageFromFirebaseException(e));
      DialogHelper.hideDialog();
      return status;
    } on Exception catch (e) {
      debugPrint('A general exception has occured. $e');
      FirebaseAuthenticationResult.error(
          errorMessage:
              'We could not create your account at this time. Please try again.');
      DialogHelper.hideDialog();
      return status;
    }
  }

//phone number with country code
  // Future<bool> mobileOtp({required String phoneno}) async {
  //   DialogHelper.showLoading();
  //   bool status = false;
  //   try {
  //     // await auth
  //     //     .requestVerificationCode(
  //     //         phoneNumber: phoneno,
  //     //         onCodeSent: (verificationId) => print(verificationId))
  //     //     .then((value) => status = true);
  //     await _firebaseAuth
  //         .verifyPhoneNumber(
  //       phoneNumber: phoneno,

  //       /// Automatic handling of the SMS code on Android devices.
  //       verificationCompleted:
  //           (PhoneAuthCredential phoneAuthCredential) async {},

  //       /// Handle failure events such as invalid phone numbers or whether the SMS
  //       /// quota has been exceeded.
  //       verificationFailed: (FirebaseAuthException firebaseAuthException) {},

  //       /// Handle when a code has been sent to the device from Firebase, used to
  //       /// prompt users to enter the code.
  //       codeSent: (String verificationId, int? resendToken) async {
  //         _mobileVerificationId = verificationId;
  //       },

  //       /// Handle a timeout of when automatic SMS code handling fails.
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         _mobileVerificationId = verificationId;
  //       },
  //     )
  //         .then((value) {
  //       print(_mobileVerificationId);
  //       print(true);
  //       return status = true;
  //     });
  //     DialogHelper.hideDialog();
  //     return status;
  //   } on Exception catch (e) {
  //     debugPrint(e.toString());
  //     DialogHelper.hideDialog();
  //     return status;
  //   }
  // }

//phone number with country code
  Future<bool> mobileOtp({required String phoneno}) async {
    bool status = false;
    await auth
        .requestVerificationCode(
            onVerificationCompleted: (authenticationResult) {},
            phoneNumber: phoneno,
            onCodeSent: (verificationId) =>
                _mobileVerificationId = verificationId)
        .then((value) => status = true);
    return status;
  }

  Future<bool> verifyMobileOtp({required String otp, String type = ''}) async {
    bool status = false;
    await authenticateWithOtp(otp).then((value) async {
      if (type == 'newAccount') {
        return status = await linkMultipleFirebaseAccount(phoneAuthCredential!);
      } else {
        await _firebaseAuth
            .signInWithCredential(phoneAuthCredential!)
            .then((value) async {
          await handleGetContact();
          return status = true;
        });
      }
    });
    return status;
  }

  Future authenticateWithOtp(String otp) async {
    if (_mobileVerificationId == null) {
      throw 'The _mobileVerificationId should not be null here. Verification was probably skipped.';
    }

    try {
      phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: _mobileVerificationId!, smsCode: otp);
    } on FirebaseAuthException catch (e) {
      log('A Firebase exception has occured. $e');
      return FirebaseAuthenticationResult.error(
        exceptionCode: e.code.toLowerCase(),
        errorMessage: getErrorMessageFromFirebaseException(e),
      );
    } on Exception catch (e) {
      log('A general exception has occured. $e');
      return FirebaseAuthenticationResult.error(
        errorMessage:
            'We could not authenticate with OTP at this time. Please try again.',
      );
    }
  }

  Future<void> handleGetContact() async {
    final mytoken = await _firebaseAuth.currentUser!.getIdToken(true);
    // final fireUid = _firebaseAuth.currentUser!.uid;
    print('I am token $mytoken');
    Get.find<GetStorageService>().setEncjwToken = mytoken ?? '';
    // Get.find<GetStorageService>().setEncjwToken = fireUid;
    log(Get.find<GetStorageService>().getEncjwToken);
    // debugPrint('i am user id${Get.find<GetStorageService>().getFirebaseUid}');
  }

  Future<bool> linkMultipleFirebaseAccount(AuthCredential credential) async {
    bool status = false;
    try {
      await FirebaseAuth.instance.currentUser
          ?.linkWithCredential(credential)
          .then((value) async {
        // print('i am linked fuid ${_firebaseAuth.currentUser!.uid}');
        if (value.user != null) {
          await handleGetContact();
          status = true;
        }
      }).onError((error, stackTrace) {
        // print('bhai lafda ho gaya');
        showMySnackbar(msg: 'Wrong OTP');
        status = false;
      });
      return status;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          // print("The provider has already been linked to the user.");
          break;
        case "invalid-credential":
          // print("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          // print("The account corresponding to the credential already exists, "
          // "or is already linked to a Firebase User.");
          break;
        // See the API reference for the full list of error codes.
        default:
        // print("Unknown error.");
      }
      return status;
    }
  }

  Future<void> logOutUser() async {
    DialogHelper.showLoading();
    // erase the user's token and data in GetStorageService
    Get.find<GetStorageService>().logout();
    // firbase logout
    await auth.logout();
    // navigate to login page
    await Get.offAllNamed(Routes.SPLASH);
    await DialogHelper.hideDialog();
  }
}
