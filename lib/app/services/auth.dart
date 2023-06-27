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

  String? _mobileVerificationId;

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
  Future<bool> mobileOtp({required String phoneno}) async {
    DialogHelper.showLoading();
    bool status = false;
    try {
      // await auth
      //     .requestVerificationCode(
      //         phoneNumber: phoneno,
      //         onCodeSent: (verificationId) => print(verificationId))
      //     .then((value) => status = true);
      await _firebaseAuth
          .verifyPhoneNumber(
        phoneNumber: phoneno,

        /// Automatic handling of the SMS code on Android devices.
        verificationCompleted:
            (PhoneAuthCredential phoneAuthCredential) async {},

        /// Handle failure events such as invalid phone numbers or whether the SMS
        /// quota has been exceeded.
        verificationFailed: (FirebaseAuthException firebaseAuthException) {},

        /// Handle when a code has been sent to the device from Firebase, used to
        /// prompt users to enter the code.
        codeSent: (String verificationId, int? resendToken) async {
          _mobileVerificationId = verificationId;
        },

        /// Handle a timeout of when automatic SMS code handling fails.
        codeAutoRetrievalTimeout: (String verificationId) {
          _mobileVerificationId = verificationId;
        },
      )
          .then((value) {
        print(_mobileVerificationId);
        print(true);
        return status = true;
      });
      DialogHelper.hideDialog();
      return status;
    } on Exception catch (e) {
      debugPrint(e.toString());
      DialogHelper.hideDialog();
      return status;
    }
  }

  Future<bool> verifyMobileOtp({required String otp, String type = ''}) async {
    DialogHelper.showLoading();
    try {
      print(' mai id hu  $otp');
      final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _mobileVerificationId!,
        smsCode: otp,
      );
      if (type == 'newAccount') {
        print('i am link multiple');
        await linkMultipleFirebaseAccount(phoneAuthCredential);
      } else {
        await _firebaseAuth
            .signInWithCredential(
          phoneAuthCredential,
        )
            .then((value) async {
          await handleGetContact();
        });
      }

      DialogHelper.hideDialog();
      return true;
    } on FirebaseAuthException catch (e) {
      showMySnackbar(msg: e.toString());
      debugPrint('A Firebase exception has occured. $e');
      DialogHelper.hideDialog();
      return false;
    } on Exception catch (e) {
      debugPrint('A general exception has occured. $e');
      DialogHelper.hideDialog();
      return false;
    }
  }

  Future<void> handleGetContact() async {
    final mytoken = await _firebaseAuth.currentUser!.getIdToken(true);
    // final fireUid = _firebaseAuth.currentUser!.uid;

    Get.find<GetStorageService>().setEncjwToken = mytoken;
    // Get.find<GetStorageService>().setEncjwToken = fireUid;
    log(Get.find<GetStorageService>().getEncjwToken);
    // debugPrint('i am user id${Get.find<GetStorageService>().getFirebaseUid}');
  }

  linkMultipleFirebaseAccount(AuthCredential credential) async {
    try {
      await FirebaseAuth.instance.currentUser
          ?.linkWithCredential(credential)
          .then((value) async {
        print('i am linked fuid ${_firebaseAuth.currentUser!.uid}');
        if (value.user != null) {
          await handleGetContact();
        }
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          print("The provider has already been linked to the user.");
          break;
        case "invalid-credential":
          print("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          print("The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User.");
          break;
        // See the API reference for the full list of error codes.
        default:
          print("Unknown error.");
      }
    }
  }

  Future<void> logOutUser() async {
    DialogHelper.showLoading();
    // erase the user's token and data in GetStorageService
    Get.find<GetStorageService>().logout();
    // firbase logout
    await auth.logout();
    // navigate to login page
    await Get.offAllNamed(Routes.LOGIN);
    await DialogHelper.hideDialog();
  }
}
