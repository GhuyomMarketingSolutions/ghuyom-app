import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ghuyom/app/services/index.dart';

import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.kw, vertical: 25.kh),
              child: Obx(
                () => GhuyomButton(
                  isActive: controller.isButtonActive.value,
                  onPressed: () => controller.onConfirmTap(),
                  label: LocaleKeys.confirm.tr,
                ),
              ),
            ),
            // resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: 20.paddingHorizontal,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      48.kheightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GhuyomRoundedBox(
                            onTap: () => Get.back(),
                            borderWidth: 1.kh,
                            height: 39.kh,
                            width: 39.kh,
                            isBorder: true,
                            borderColor: const Color(0xffD8DADC),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.kw, vertical: 12.kh),
                              child: CommonImageView(
                                svgPath: ImageConstant.svgBackArrow,
                              ),
                            )),
                      ),
                      34.kheightBox,
                      LocaleKeys.create_account.tr.text700(30.kh),
                      25.kheightBox,
                      GhuyomTextField(
                        onChanged: (p0) => controller.onFormChange(),
                        controller: controller.nameController,
                        hint: LocaleKeys.your_name.tr,
                        label: LocaleKeys.name.tr,
                      ),
                      20.kheightBox,
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: LocaleKeys.gender.tr,
                            style: TextStyleUtil.manrope500(
                                fontSize: 14.kh, color: Colors.black)),
                        TextSpan(
                            text: LocaleKeys.optional.tr,
                            style: TextStyleUtil.manrope500(
                                fontSize: 14.kh,
                                color: const Color(0xff909090)))
                      ])),
                      Obx(
                        () => Column(
                          children: [
                            RadioListTile(
                              title: LocaleKeys.male.tr.text400(14.kh),
                              contentPadding: EdgeInsets.zero,
                              activeColor: Colors.black,
                              dense: true,
                              value: 1,
                              groupValue: controller.radioVal.value,
                              onChanged: (value) {
                                controller.onRadioTap(value);
                                controller.onFormChange();
                              },
                            ),
                            RadioListTile(
                              visualDensity: VisualDensity.compact,
                              title: LocaleKeys.female.tr.text400(14.kh),
                              contentPadding: EdgeInsets.zero,
                              activeColor: Colors.black,
                              dense: true,
                              value: 0,
                              groupValue: controller.radioVal.value,
                              onChanged: (value) {
                                controller.onRadioTap(value);
                                controller.onFormChange();
                              },
                            ),
                          ],
                        ),
                      ),
                      15.kheightBox,
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.kh),
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              splashRadius: 0,
                              visualDensity: VisualDensity.compact,
                              activeColor: Colors.white,
                              side: BorderSide(
                                width: 1.kh,
                                color: const Color(0xff94C180),
                              ),
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => const Color(0xff94C180)),
                              value: controller.isCheck.value,
                              onChanged: (value) {
                                controller.onCheckTap(value);
                                controller.onFormChange();
                              },
                            ),
                          ),
                          LocaleKeys.i_accept_the.tr.text400(14.kh)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
