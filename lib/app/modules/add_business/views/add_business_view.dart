import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/components/ghuyom_dropdown.dart';
import 'package:ghuyom/app/services/colors.dart';
import '../../../services/index.dart';
import '../controllers/add_business_controller.dart';

class AddBusinessView extends GetView<AddBusinessController> {
  const AddBusinessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.onBackTap(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: Padding(
              padding: paddingSymmetric(horizontal: 20.kw, vertical: 25.kh),
              child: GhuyomButton(
                onPressed: () => controller.onContinueTap(),
                label: LocaleKeys.xcontinue.tr,
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: paddingOnly(left: 20.kw, right: 20.kw, top: 52.kh),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GhuyomRoundedBox(
                              height: 40.kh,
                              width: 40.kh,
                              isBorder: true,
                              borderColor: const Color(0xffD8DADC),
                              borderRadius: 10.kh,
                              borderWidth: 1.kh,
                              onTap: () => controller.onBackTap(),
                              child: Center(
                                child: CommonImageView(
                                  height: 15.kh,
                                  width: 9.kh,
                                  svgPath: ImageConstant.svgBack,
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Obx(
                          () => controller.appBarTitle.value
                              .text600(18.kh, textAlign: TextAlign.center),
                        ),
                      ),
                      const Expanded(flex: 2, child: Row())
                    ],
                  ),
                ),
                46.kheightBox,
                Obx(() => widgets(context))
              ],
            )),
      ),
    );
  }

  widgets(BuildContext context) {
    switch (controller.step.value) {
      case 0:
        return addYourBusiness();
      case 1:
        return addMoreInformation(context);
      case 2:
        return addPictures();
    }
  }

  Widget addYourBusiness() {
    return Form(
      key: controller.formKey1,
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LocaleKeys.name_of_your_business.tr.text600(16.kh),
                10.kheightBox,
                GhuyomTextField(
                  controller: controller.businessNameController,
                  validator: (value) => controller.commonValidator(value),
                  hintFont: 14.kh,
                  radius: 5.kh,
                  hint: LocaleKeys.enter_business.tr,
                  hintColor: const Color(0xffB0B0B0),
                ),
                20.kheightBox,
                LocaleKeys.choose_a_category.tr.text600(16.kh),
                10.kheightBox,
                GhuyomRoundedBox(
                  borderRadius: 5.kh,
                  isBorder: true,
                  borderWidth: 1.kh,
                  borderColor: const Color(0xffD9D9D9),
                  child: Padding(
                    padding: 7.paddingHorizontal,
                    child: Obx(
                      () => GhuyomDropDown(
                          items: controller.dropdownItems,
                          onChanged: (value) => controller.onDropDownTap(value),
                          value: controller.dropDownValue.value),
                    ),
                  ),
                ),
                20.kheightBox,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: LocaleKeys.subcategory.tr,
                      style: TextStyleUtil.manrope600(fontSize: 16.kh)),
                  TextSpan(
                      text: LocaleKeys.optional.tr,
                      style: TextStyleUtil.manrope400(
                          fontSize: 14.kh, color: const Color(0xffB0B0B0))),
                  TextSpan(
                      text: '\n${LocaleKeys.enter_a_more.tr}',
                      style: TextStyleUtil.manrope400(
                          fontSize: 12.kh, color: const Color(0xffB0B0B0))),
                ])),
                10.kheightBox,
                GhuyomTextField(
                  controller: controller.subcategoryController,
                  hintFont: 14.kh,
                  radius: 5.kh,
                  hint: LocaleKeys.enter_a_subcategory.tr,
                  hintColor: const Color(0xffB0B0B0),
                ),
                20.kheightBox,
                LocaleKeys.description.tr.text600(16.kh),
                10.kheightBox,
                GhuyomTextField(
                  controller: controller.descriptionController,
                  validator: (value) => controller.commonValidator(value),
                  hintFont: 14.kh,
                  radius: 5.kh,
                  maxLines: 5,
                  hint: LocaleKeys.enter_a_description.tr,
                  hintColor: const Color(0xffB0B0B0),
                ),
                20.kheightBox,
                LocaleKeys.address.tr.text600(16.kh),
                10.kheightBox,
                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.kw, vertical: 12.kh),
                        isDense: true,
                        hintText: LocaleKeys.enter_an_address.tr,
                        hintStyle: TextStyleUtil.manrope400(
                            fontSize: 14.kh, color: const Color(0xffB0B0B0)),
                        fillColor: Colors.white,
                        filled: true,
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.kh, color: const Color(0xffD8DADC)),
                            borderRadius: BorderRadius.circular(5.kh)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.kh, color: const Color(0xffD8DADC)),
                            borderRadius: BorderRadius.circular(5.kh)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.kh, color: const Color(0xffD8DADC)),
                            borderRadius: BorderRadius.circular(5.kh)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.kh, color: const Color(0xffD8DADC)),
                            borderRadius: BorderRadius.circular(5.kh)),
                      ),
                      controller: controller.addressController),
                  validator: (value) => controller.locationValidator(value),
                  onSuggestionSelected: (suggestion) =>
                      controller.setLatLong(suggestion),
                  itemBuilder: (context, itemData) => ListTile(
                    title: Text(itemData['name'] ?? ''),
                  ),
                  suggestionsCallback: (pattern) =>
                      controller.getGooglePlacesSuggestions(pattern),
                ),
                100.kheightBox
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addMoreInformation(BuildContext context) {
    return Form(
      key: controller.formKey2,
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: LocaleKeys.instagram.tr,
                      style: TextStyleUtil.manrope600(fontSize: 16.kh)),
                  TextSpan(
                      text: LocaleKeys.optional.tr,
                      style: TextStyleUtil.manrope400(
                          fontSize: 14.kh, color: const Color(0xffB0B0B0))),
                ])),
                10.kheightBox,
                GhuyomTextField(
                  controller: controller.instaController,
                  hint: '',
                  hintFont: 14.kh,
                  radius: 5.kh,
                  hintColor: const Color(0xffB0B0B0),
                ),
                20.kheightBox,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: LocaleKeys.website.tr,
                      style: TextStyleUtil.manrope600(fontSize: 16.kh)),
                  TextSpan(
                      text: LocaleKeys.optional.tr,
                      style: TextStyleUtil.manrope400(
                          fontSize: 14.kh, color: const Color(0xffB0B0B0))),
                ])),
                10.kheightBox,
                GhuyomTextField(
                  controller: controller.websiteController,
                  hint: '',
                  hintFont: 14.kh,
                  radius: 5.kh,
                  hintColor: const Color(0xffB0B0B0),
                ),
                20.kheightBox,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: LocaleKeys.phone_number.tr,
                      style: TextStyleUtil.manrope600(fontSize: 16.kh)),
                  TextSpan(
                      text: '\n${LocaleKeys.add_a_phone.tr}',
                      style: TextStyleUtil.manrope400(
                          fontSize: 14.kh, color: const Color(0xffB0B0B0))),
                ])),
                10.kheightBox,
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.kh)),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashRadius: 0,
                        visualDensity: VisualDensity.compact,
                        activeColor: Colors.black,
                        side: BorderSide(width: 1.kh, color: Colors.black),
                        checkColor: Colors.black,
                        value: controller.isOnWhatsapp.value,
                        onChanged: (value) => controller.onCheckTap(value, 0),
                      ),
                    ),
                    LocaleKeys.this_number_is.tr.text400(14.kh),
                    5.kwidthBox,
                    CommonImageView(
                      height: 24.kh,
                      width: 24.kh,
                      svgPath: ImageConstant.svgWhatsapp,
                    )
                  ],
                ),
                10.kheightBox,
                GetBuilder(builder: (AddBusinessController controller) {
                  return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.phoneControllers.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: GhuyomTextField(
                                    maxLength: 8,
                                    textInputType: TextInputType.number,
                                    validator: (value) =>
                                        controller.phoneValidator(value),
                                    controller:
                                        controller.phoneControllers[index],
                                    hint: '0000 0000',
                                    hintFont: 14.kh,
                                    radius: 5.kh,
                                    hintColor: const Color(0xffB0B0B0),
                                  ),
                                ),
                                index != 0
                                    ? IconButton(
                                        onPressed: () => controller
                                            .onRemovePhoneNoTap(index),
                                        icon: const Icon(Icons.close))
                                    : Container()
                              ],
                            ),
                            16.kheightBox
                          ],
                        );
                      });
                }),
                17.kheightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: GhuyomButton(
                    borderRadius: 5.kh,
                    color: ColorUtil.mainColorPink,
                    height: 34.kh,
                    onPressed: () => controller.onAddPhoneNoTap(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add),
                        LocaleKeys.add_phone_number.tr
                            .text600(12.kh, color: Colors.white)
                      ],
                    ),
                  ),
                ),
                20.kheightBox,
                LocaleKeys.working_hours.tr.text600(16.kh),
                10.kheightBox,
                Obx(
                  () => Row(
                    children: List.generate(controller.days.length, (index) {
                      return Row(
                        children: [
                          controller.daysBool[index] == true
                              ? GhuyomRoundedBox(
                                  onTap: () => controller.onDayTap(index),
                                  height: 30.kh,
                                  width: 30.kh,
                                  borderRadius: 100,
                                  color: ColorUtil.mainColorPink,
                                  child: Center(
                                    child:
                                        controller.days[index].text400(16.kh),
                                  ))
                              : GhuyomRoundedBox(
                                  onTap: () => controller.onDayTap(index),
                                  isBorder: true,
                                  borderWidth: 1.kh,
                                  borderColor: const Color(0xffC4C4C4),
                                  height: 30.kh,
                                  width: 30.kh,
                                  borderRadius: 100,
                                  child: Center(
                                    child: controller.days[index].text400(16.kh,
                                        color: const Color(0xffC4C4C4)),
                                  )),
                          5.kwidthBox
                        ],
                      );
                    }),
                  ),
                ),
                12.kheightBox,
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.kh),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashRadius: 0,
                        visualDensity: VisualDensity.compact,
                        activeColor: Colors.black,
                        side: BorderSide(
                          width: 1.kh,
                          color: Colors.black,
                        ),
                        value: controller.isOpen24Hours.value,
                        onChanged: (value) => controller.onCheckTap(value, 1),
                      ),
                    ),
                    LocaleKeys.open_24.tr.text400(12.kh),
                    18.kwidthBox,
                    Obx(
                      () => Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.kh),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashRadius: 0,
                        visualDensity: VisualDensity.compact,
                        activeColor: Colors.black,
                        side: BorderSide(width: 1.kh, color: Colors.black),
                        value: controller.isShopClosed.value,
                        onChanged: (value) => controller.onCheckTap(value, 2),
                      ),
                    ),
                    LocaleKeys.closed.tr.text400(12.kh)
                  ],
                ),
                12.kheightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        LocaleKeys.open_time.tr.text400(10.kh),
                        3.kheightBox,
                        GhuyomRoundedBox(
                            onTap: () => controller.onTimeTap(context, 0),
                            borderRadius: 5.kh,
                            isBorder: true,
                            borderWidth: 1.kh,
                            borderColor: Colors.black,
                            child: Padding(
                              padding: paddingSymmetric(
                                  horizontal: 8.kw, vertical: 3.kh),
                              child: controller.openTime.value.text400(12.kh),
                            )),
                        5.kheightBox
                      ],
                    ),
                    11.kwidthBox,
                    Column(
                      children: [
                        LocaleKeys.close_time.tr.text400(10.kh),
                        3.kheightBox,
                        GhuyomRoundedBox(
                            onTap: () => controller.onTimeTap(context, 1),
                            borderRadius: 5.kh,
                            isBorder: true,
                            borderWidth: 1.kh,
                            borderColor: Colors.black,
                            child: Padding(
                              padding: paddingSymmetric(
                                  horizontal: 8.kw, vertical: 3.kh),
                              child: controller.closeTime.value.text400(12.kh),
                            )),
                        5.kheightBox
                      ],
                    ),
                    12.kwidthBox,
                    Obx(
                      () => Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.kh),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashRadius: 0,
                        visualDensity: VisualDensity.compact,
                        activeColor: Colors.black,
                        side: BorderSide(
                          width: 1.kh,
                          color: Colors.black,
                        ),
                        value: controller.isCheck3.value,
                        onChanged: (value) => controller.onCheckTap(value, 3),
                      ),
                    ),
                    Padding(
                      padding: paddingOnly(bottom: 8.kh),
                      child: 'M-F'.text400(12.kh),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addPictures() {
    return GetBuilder(builder: (AddBusinessController controller) {
      return Padding(
        padding: 20.paddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: GhuyomRoundedBox(
                      height: 110.kh,
                      onTap: () => controller.onAddPictureTap(0),
                      borderRadius: 5.kh,
                      isBorder: true,
                      borderWidth: 1.kh,
                      borderColor: ColorUtil.mainColorGrey1,
                      child: controller.file1 == null &&
                              controller.imageUrl[0] == ''
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonImageView(
                                  height: 24.kh,
                                  width: 24.kh,
                                  svgPath: ImageConstant.svgCamera,
                                ),
                                2.kheightBox,
                                LocaleKeys.add_picture.tr.text500(14.kh)
                              ],
                            )
                          : controller.imageUrl[0] == ''
                              ? CommonImageView(
                                  fit: BoxFit.cover,
                                  file: controller.file1,
                                )
                              : CommonImageView(
                                  fit: BoxFit.cover,
                                  url: controller.imageUrl[0],
                                )),
                ),
                12.kwidthBox,
                Expanded(
                  child: GhuyomRoundedBox(
                      height: 110.kh,
                      onTap: () => controller.onAddPictureTap(1),
                      borderRadius: 5.kh,
                      isBorder: true,
                      borderWidth: 1.kh,
                      borderColor: ColorUtil.mainColorGrey1,
                      child: controller.file2 == null &&
                              controller.imageUrl[1] == ''
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonImageView(
                                  height: 24.kh,
                                  width: 24.kh,
                                  svgPath: ImageConstant.svgCamera,
                                ),
                                2.kheightBox,
                                LocaleKeys.add_picture.tr.text500(14.kh)
                              ],
                            )
                          : controller.imageUrl[1] == ''
                              ? CommonImageView(
                                  fit: BoxFit.cover,
                                  file: controller.file2,
                                )
                              : CommonImageView(
                                  fit: BoxFit.cover,
                                  url: controller.imageUrl[1],
                                )),
                ),
              ],
            ),
            12.kheightBox,
            Row(
              children: [
                Expanded(
                  child: GhuyomRoundedBox(
                      height: 110.kh,
                      onTap: () => controller.onAddPictureTap(2),
                      borderRadius: 5.kh,
                      isBorder: true,
                      borderWidth: 1.kh,
                      borderColor: ColorUtil.mainColorGrey1,
                      child: controller.file3 == null &&
                              controller.imageUrl[2] == ''
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonImageView(
                                  height: 24.kh,
                                  width: 24.kh,
                                  svgPath: ImageConstant.svgCamera,
                                ),
                                2.kheightBox,
                                LocaleKeys.add_picture.tr.text500(14.kh)
                              ],
                            )
                          : controller.imageUrl[2] == ''
                              ? CommonImageView(
                                  fit: BoxFit.cover,
                                  file: controller.file3,
                                )
                              : CommonImageView(
                                  fit: BoxFit.cover,
                                  url: controller.imageUrl[2],
                                )),
                ),
                12.kwidthBox,
                Expanded(
                  child: GhuyomRoundedBox(
                      height: 110.kh,
                      onTap: () => controller.onAddPictureTap(3),
                      borderRadius: 5.kh,
                      isBorder: true,
                      borderWidth: 1.kh,
                      borderColor: ColorUtil.mainColorGrey1,
                      child: controller.file4 == null &&
                              controller.imageUrl[3] == ''
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonImageView(
                                  height: 24.kh,
                                  width: 24.kh,
                                  svgPath: ImageConstant.svgCamera,
                                ),
                                2.kheightBox,
                                LocaleKeys.add_picture.tr.text500(14.kh)
                              ],
                            )
                          : controller.imageUrl[3] == ''
                              ? CommonImageView(
                                  fit: BoxFit.cover,
                                  file: controller.file4,
                                )
                              : CommonImageView(
                                  fit: BoxFit.cover,
                                  url: controller.imageUrl[3],
                                )),
                ),
              ],
            ),
            12.kheightBox,
            LocaleKeys.the_app_accepts.tr.text400(12.kh,
                textAlign: TextAlign.center, color: const Color(0xffB0B0B0))
          ],
        ),
      );
    });
  }
}
