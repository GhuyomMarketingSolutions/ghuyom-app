import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/index.dart';

import '../../../services/colors.dart';
import '../controllers/add_service_controller.dart';

class AddService extends GetView<AddServiceController> {
  const AddService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: GhuyomButton(
        onPressed: () => controller.onDoneTap(),
        label: LocaleKeys.done.tr,
      ).paddingOnly(left: 20.kw, right: 20.kw, bottom: 30.kh),
      body: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            52.kheightBox,
            Row(
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
                        onTap: () => Get.back(),
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
                  child: LocaleKeys.add_your_services.tr
                      .text600(18.kh, textAlign: TextAlign.center),
                ),
                const Expanded(flex: 2, child: Row())
              ],
            ),
            45.kheightBox,
            GhuyomTextField(
              controller: controller.nameController,
              validator: (value) => controller.commonValidator(value),
              radius: 5.kh,
              hint: LocaleKeys.enter_a_name.tr,
              label: LocaleKeys.name_of_your_service.tr,
            ),
            22.kheightBox,
            GhuyomTextField(
              controller: controller.descriptionController,
              validator: (value) => controller.commonValidator(value),
              radius: 5.kh,
              hint: LocaleKeys.describe_your_service.tr,
              label: LocaleKeys.description.tr,
              maxLines: 4,
            ),
            22.kheightBox,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: LocaleKeys.price_of_your_service.tr,
                  style: TextStyleUtil.manrope600(fontSize: 16.kh)),
              TextSpan(
                  text: LocaleKeys.optional.tr,
                  style: TextStyleUtil.manrope600(
                      fontSize: 16.kh, color: const Color(0xffB0B0B0)))
            ])),
            10.kheightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                '\$'.text600(16.kh),
                5.kwidthBox,
                SizedBox(
                  width: 50.kw,
                  child: TextFormField(
                    controller: controller.priceController,
                    keyboardType: TextInputType.number,
                    validator: (value) => controller.commonValidator(value),
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    maxLines: 1,
                    cursorHeight: 10,
                    style: TextStyleUtil.manrope500(
                        fontSize: 12.kh, color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      fillColor: Colors.white,
                      filled: true,
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.kh, color: const Color(0xffD8DADC)),
                          borderRadius: BorderRadius.circular(10.kh)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.kh, color: const Color(0xffD8DADC)),
                          borderRadius: BorderRadius.circular(10.kh)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.kh, color: const Color(0xffD8DADC)),
                          borderRadius: BorderRadius.circular(10.kh)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.kh, color: const Color(0xffD8DADC)),
                          borderRadius: BorderRadius.circular(10.kh)),
                    ),
                  ),
                ),
              ],
            ),
            22.kheightBox,
            LocaleKeys.choose_a_picture.tr.text600(16.kh),
            10.kheightBox,
            Align(
              alignment: Alignment.centerLeft,
              child: GhuyomRoundedBox(
                  height: 110.kh,
                  onTap: () => controller.onAddPictureTap(),
                  borderRadius: 5.kh,
                  isBorder: true,
                  borderWidth: 1.kh,
                  borderColor: ColorUtil.mainColorGrey1,
                  child: GetBuilder(
                    builder: (AddServiceController controller) =>
                        controller.file != null
                            ? CommonImageView(
                                fit: BoxFit.cover,
                                file: controller.file,
                              )
                            : Column(
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
                              ).paddingSymmetric(
                                horizontal: 20.kw, vertical: 30.kh),
                  )),
            ),
          ],
        ).paddingSymmetric(horizontal: 20.kw),
      ),
    );
  }
}
