import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/get_utils.dart';

import 'package:ghuyom/app/routes/app_pages.dart';
import 'package:ghuyom/app/services/dio/api_service.dart';
import 'package:ghuyom/app/services/snackbar.dart';
import 'package:ghuyom/generated/locales.g.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/google_places_details_api.dart';
import '../../../models/get_all_businesses_model.dart';
import '../../../models/google_place_api_response.dart';
import '../../../services/dio/endpoints.dart';

class AddBusinessController extends GetxController {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController instaController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  List<TextEditingController> phoneControllers = <TextEditingController>[];

  List<Map<String, dynamic>> phoneNos = [];
  Businesses? business;

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  RxString dropDownValue = 'Restaurant'.obs;
  RxString openTime = TimeOfDay.now().format(Get.context!).obs;
  RxString closeTime = TimeOfDay.now().format(Get.context!).obs;
  RxString appBarTitle = LocaleKeys.add_your_business.tr.obs;

  RxInt step = 0.obs;

  GooglePlacesAPIResponse? gApi;
  GooglePlacesDetailsAPI? gDetailsApi;

  double? lati;
  double? long;

  RxBool isOnWhatsapp = false.obs;
  RxBool isOpen24Hours = false.obs;
  RxBool isShopClosed = false.obs;
  RxBool isCheck3 = false.obs;

  List imageUrl = <String>['', '', '', ''].obs;

  File? file1, file2, file3, file4;

  RxList<String> days = <String>['M', 'T', 'W', 'T', 'F', 'S', 'S'].obs;

  RxList<bool> daysBool =
      <bool>[false, true, false, false, false, false, false].obs;

  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(
        value: 'Restaurant', child: Text(LocaleKeys.restaurants.tr)),
    DropdownMenuItem(
        value: 'Hair Salon', child: Text(LocaleKeys.hair_salon.tr)),
    DropdownMenuItem(
        value: 'Barber Shop', child: Text(LocaleKeys.barber_shops.tr)),
    DropdownMenuItem(
        value: 'Beauty & Wellness', child: Text(LocaleKeys.beauty_wellness.tr)),
    DropdownMenuItem(
        value: 'Clothing & Accessories',
        child: Text(LocaleKeys.clothing_accessories.tr)),
    DropdownMenuItem(
        value: 'Fitness & Gyms', child: Text(LocaleKeys.fitness_gyms.tr)),
    DropdownMenuItem(
        value: 'Home & Cleaning Service',
        child: Text(LocaleKeys.home_cleaning_service.tr)),
    DropdownMenuItem(
        value: 'Home Based Business',
        child: Text(LocaleKeys.home_based_business.tr)),
    DropdownMenuItem(
        value: 'Adventure & Tourism',
        child: Text(LocaleKeys.adventure_tourism.tr)),
    DropdownMenuItem(
        value: 'Local Goods', child: Text(LocaleKeys.local_goods.tr)),
  ];
  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    phoneControllers.add(TextEditingController());

    Get.arguments != null
        ? {
            business = Get.arguments,
          }
        : null;
  }

  @override
  void onReady() {
    super.onReady();
    Get.arguments != null ? editBusiness() : null;
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  onDropDownTap(value) {
    dropDownValue.value = value;
  }

  locationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter location';
    }
  }

  commonValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return LocaleKeys.please_enter.tr;
    }
  }

  phoneValidator(String? value) {
    if ((value?.isEmpty ?? true) || value?.length != 8) {
      return LocaleKeys.proper_number.tr;
    }
  }

  setLatLong(Map<String, String>? suggestion) async {
    addressController.text = suggestion?['name'] ?? '';
    try {
      await dio
          .get(
              'https://maps.googleapis.com/maps/api/place/details/json?place_id=${suggestion?['placeId']}&key=${Endpoints.googlePlacesAPIKey}')
          .then((value) =>
              gDetailsApi = GooglePlacesDetailsAPI.fromJson(value.data));
      lati = gDetailsApi?.result?.geometry?.location?.lat;
      long = gDetailsApi?.result?.geometry?.location?.lng;
      debugPrint('$lati + $long');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  onBackTap() {
    switch (step.value) {
      case 0:
        Get.back();
        return true;
      case 1:
        appBarTitle.value = LocaleKeys.add_your_business.tr;
        step.value = 0;
        return false;
      case 2:
        appBarTitle.value = LocaleKeys.add_more_information.tr;
        step.value = 1;
        return false;
      default:
    }
  }

  onCheckTap(bool? value, int type) {
    switch (type) {
      case 0:
        isOnWhatsapp.value = value ?? false;
        break;
      case 1:
        isOpen24Hours.value = value ?? false;
        break;
      case 2:
        isShopClosed.value = value ?? false;
        break;
      case 3:
        for (var i = 0; i < 5; i++) {
          daysBool[i] = value ?? false;
        }

        isCheck3.value = value ?? false;
        break;
      default:
    }
  }

  onDayTap(int index) {
    if (daysBool[index] == false) {
      daysBool[index] = true;
    } else {
      daysBool[index] = false;
    }
  }

  onAddPictureTap(int index) async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        savePic(index, image.path);
      }
      update();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  savePic(int index, String path) {
    switch (index) {
      case 1:
        return file1 = File(path);
      case 2:
        return file2 = File(path);
      case 3:
        return file3 = File(path);
      case 4:
        return file4 = File(path);
    }
  }

  onContinueTap() {
    if (step.value == 0) {
      processAddYourBusines();
    } else if (step.value == 1) {
      processsAddMoreInformation();
    } else if (step.value == 2) {
      hittingApis();
    }
  }

  processsAddMoreInformation() {
    if (formKey2.currentState!.validate()) {
      if (!daysBool.contains(true)) {
        showMySnackbar(msg: 'Please select working days');
      } else {
        phoneNos.clear();
        for (var i = 0; i < phoneControllers.length; i++) {
          phoneNos.add({
            "number": phoneControllers[i].text,
            "isWhatsappAvailable": i == 0 ? isOnWhatsapp.value : false
          });
        }

        appBarTitle.value = LocaleKeys.add_pictures.tr;
        step.value = 2;
      }
    }
  }

  processAddYourBusines() {
    if (formKey1.currentState!.validate()) {
      appBarTitle.value = LocaleKeys.add_more_information.tr;
      step.value = 1;
    }
  }

  hittingApis() async {
    if (file1 == null || file2 == null || file3 == null || file4 == null) {
      showMySnackbar(msg: 'Please select all four pictures');
    } else {
      await postAddPictures();
    }
  }

  postAddPictures() async {
    try {
      await APIManager.addMultiplePhotos(
          body: FormData.fromMap({
        'images': [
          await MultipartFile.fromFile(file1?.path ?? ''),
          await MultipartFile.fromFile(file2?.path ?? ''),
          await MultipartFile.fromFile(file3?.path ?? ''),
          await MultipartFile.fromFile(file4?.path ?? ''),
        ],
        'type': 'business'
      })).then((value) async {
        if (value.data['status']) {
          imageUrl = value.data['urls']['images'];
          print(imageUrl);
          await postAddBusiness();
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  onAddPhoneNoTap() {
    phoneControllers.add(TextEditingController());
    update();
  }

  postAddBusiness() async {
    try {
      await APIManager.postAddBusiness(body: {
        "name": businessNameController.text,
        "category": dropDownValue.value,
        "subCategory": subcategoryController.text,
        "description": descriptionController.text,
        "address": addressController.text,
        "coordinates": [long, lati],
        "instagram": instaController.text,
        "website": websiteController.text,
        "phoneNumber": phoneNos,
        "workingHours": {
          "days": {
            "monday": daysBool[0],
            "tuesday": daysBool[1],
            "wednesday": daysBool[2],
            "thursday": daysBool[3],
            "friday": daysBool[4],
            "saturday": daysBool[5],
            "sunday": daysBool[6]
          },
          "startTime": openTime.value,
          "endTime": closeTime.value,
          "isOpen24Hours": isOpen24Hours.value,
          "isClosed": isShopClosed.value
        },
        "images": imageUrl,
      }).then((value) {
        value.data['status']
            ? Get.toNamed(Routes.ADD_SERVICE,
                arguments: value.data['business']['_id'])
            : null;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  onRemovePhoneNoTap(int index) {
    phoneControllers[index].dispose();
    phoneControllers.removeAt(index);

    update();
  }

  onTimeTap(BuildContext context, int type) {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      if (value != null) {
        type == 0
            ? openTime.value = value.format(context)
            : closeTime.value = value.format(context);
      }
    });
  }

  Future<List<Map<String, String>>> getGooglePlacesSuggestions(
      String pattern) async {
    await dio
        .get(
            'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${pattern.trim()}&radius=200&key=${Endpoints.googlePlacesAPIKey}')
        .then((value) {
      gApi = GooglePlacesAPIResponse.fromJson(value.data);
      // print('gApi?.predictions?.length ${gApi?.predictions?.length}');
    });
    return List.generate(
        gApi?.predictions?.length ?? 0,
        (index) => {
              'name': gApi?.predictions?[index].description ?? '',
              'placeId': gApi?.predictions?[index].placeId ?? '',
            });
  }

  editBusiness() {
    businessNameController.text = business?.name ?? '';
    dropDownValue.value = business?.category ?? '';
    subcategoryController.text = business?.subCategory ?? '';
    descriptionController.text = business?.description ?? '';
    addressController.text = business?.address ?? '';
    long = business?.location?.coordinates?[0];
    lati = business?.location?.coordinates?[1];
    instaController.text = business?.instagram ?? '';
    websiteController.text = business?.website ?? '';
    if (business?.phoneNumber?.isNotEmpty ?? false) {
      phoneControllers = [];
      for (var element in business?.phoneNumber ?? []) {
        phoneControllers
            .add(TextEditingController(text: element.number.toString()));
      }
    }
    isOnWhatsapp.value = business?.phoneNumber?[0].isWhatsappAvailable ?? false;
    daysBool[0] = business?.workingHours?.days?.monday ?? false;
    daysBool[1] = business?.workingHours?.days?.tuesday ?? false;
    daysBool[2] = business?.workingHours?.days?.wednesday ?? false;
    daysBool[3] = business?.workingHours?.days?.thursday ?? false;
    daysBool[4] = business?.workingHours?.days?.friday ?? false;
    daysBool[5] = business?.workingHours?.days?.saturday ?? false;
    daysBool[6] = business?.workingHours?.days?.sunday ?? false;
    isOpen24Hours.value = business?.workingHours?.isOpen24Hours ?? false;
    isShopClosed.value = business?.workingHours?.isClosed ?? false;
    openTime.value = business?.workingHours?.startTime ?? '';
    closeTime.value = business?.workingHours?.endTime ?? '';
    imageUrl = business?.images ?? [];
  }
}
