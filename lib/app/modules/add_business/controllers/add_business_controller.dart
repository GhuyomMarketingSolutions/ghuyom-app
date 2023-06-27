import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/snackbar.dart';
import 'package:ghuyom/generated/locales.g.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/google_places_details_api.dart';
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

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  RxString dropDownValue = '0'.obs;
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

  File? file1, file2, file3, file4;

  RxList<String> days = <String>['M', 'T', 'W', 'T', 'F', 'S', 'S'].obs;

  RxList<bool> daysBool =
      <bool>[false, true, false, false, false, false, false].obs;

  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(value: "0", child: Text(LocaleKeys.restaurants.tr)),
    DropdownMenuItem(value: "1", child: Text(LocaleKeys.hair_salon.tr)),
    DropdownMenuItem(value: "2", child: Text(LocaleKeys.barber_shops.tr)),
    DropdownMenuItem(value: "3", child: Text(LocaleKeys.beauty_wellness.tr)),
    DropdownMenuItem(
        value: "4", child: Text(LocaleKeys.clothing_accessories.tr)),
    DropdownMenuItem(value: "5", child: Text(LocaleKeys.fitness_gyms.tr)),
    DropdownMenuItem(
        value: "6", child: Text(LocaleKeys.home_cleaning_service.tr)),
    DropdownMenuItem(
        value: "7", child: Text(LocaleKeys.home_based_business.tr)),
    DropdownMenuItem(value: "8", child: Text(LocaleKeys.adventure_tourism.tr)),
    DropdownMenuItem(value: "9", child: Text(LocaleKeys.local_goods.tr)),
  ];

  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    phoneControllers.add(TextEditingController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

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
        return Get.back();
      case 1:
        appBarTitle.value = LocaleKeys.add_your_business.tr;
        return step.value = 0;
      case 2:
        appBarTitle.value = LocaleKeys.add_more_information.tr;
        return step.value = 1;
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
        print(path);
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
        print(phoneNos);
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

  processAddPictures() {
    if (file1 == null || file2 == null || file3 == null || file4 == null) {
      showMySnackbar(msg: 'Please select all four pictures');
    } else {
      print({
        "name": businessNameController.text,
        "category": dropDownValue.value,
        "subCategory": subcategoryController.text,
        "description": descriptionController.text,
        "address": addressController.text,
        "coordinates": {"longitude": long, "lattitude": lati},
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
        "images": [
          "https://images.unsplash.com/photo-1517840901100-8179e982acb7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
          "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aG90ZWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
          "https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG90ZWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
          "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80"
        ],
      });
    }
  }

  onAddPhoneNoTap() {
    phoneControllers.add(TextEditingController());
    update();
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
    print('google');
    await dio
        .get(
            'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${pattern.trim()}&radius=200&key=${Endpoints.googlePlacesAPIKey}')
        .then((value) => gApi = GooglePlacesAPIResponse.fromJson(value.data));
    return List.generate(
        gApi?.predictions?.length ?? 0,
        (index) => {
              'name': gApi?.predictions?[index].description ?? '',
              'placeId': gApi?.predictions?[index].placeId ?? '',
            });
  }
}
