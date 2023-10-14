import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/components/ghuyom_appbar.dart';
import 'package:ghuyom/app/modules/home/views/category_tile.dart';
import 'package:ghuyom/app/services/colors.dart';
import 'package:ghuyom/app/services/index.dart';
import 'package:ghuyom/app/services/storage.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textFieldBorder = OutlineInputBorder(
        borderSide: BorderSide(width: 1.kh, color: const Color(0xffD8DADC)),
        borderRadius: BorderRadius.circular(10.kh));
    return Scaffold(
        appBar: GhuyomAppbar(
          isLeading: false,
          title: LocaleKeys.welcome.tr,
          // actions: [
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: 16.paddingRight,
          //         child: LocaleKeys.eng.tr.text500(16.kh),
          //       ),
          //     ],
          //   )
          // ],
        ),
        body: Padding(
          padding: 20.paddingHorizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CommonImageView(
                    height: 16.kh,
                    width: 16.kh,
                    fit: BoxFit.contain,
                    svgPath: ImageConstant.svgLocation,
                  ),
                  2.kwidthBox,
                  Obx(
                    () => Text(
                      controller.cityName.value,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: ColorUtil.navBarColor),
                    ),
                  ),
                ],
              ),
              20.kheightBox,
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      TypeAheadFormField(
                        debounceDuration: const Duration(milliseconds: 500),
                        hideSuggestionsOnKeyboardHide: true,
                        noItemsFoundBuilder: (context) =>
                            const SizedBox.shrink(),
                        // noItemsFoundBuilder: (context) => ListTile(
                        //     title: LocaleKeys.no_result.tr.text400(16.kh,
                        //         color: ColorUtil.mainColorGrey)),
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: controller.searchController,
                            style: TextStyleUtil.manrope400(fontSize: 16.kh),
                            decoration: InputDecoration(
                              prefixIcon: CommonImageView(
                                height: 20.kh,
                                width: 20.kh,
                                fit: BoxFit.contain,
                                svgPath: ImageConstant.svgSearch,
                              ).paddingSymmetric(
                                  horizontal: 12.kw, vertical: 9.kh),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.kw, vertical: 12.kh),
                              isDense: true,
                              hintStyle: TextStyleUtil.manrope400(
                                  fontSize: 16.kh,
                                  color: Colors.black.withOpacity(0.5)),
                              hintText: LocaleKeys.search.tr,
                              focusedErrorBorder: textFieldBorder,
                              errorBorder: textFieldBorder,
                              enabledBorder: textFieldBorder,
                              focusedBorder: textFieldBorder,
                            )),
                        onSuggestionSelected: (suggestion) =>
                            controller.onSearchTap(suggestion),
                        itemBuilder: (context, itemData) {
                          return Column(
                            children: [
                              ListTile(
                                tileColor: Colors.white,
                                dense: true, minLeadingWidth: 20.kh,
                                // onTap: () => onElementTap(context, index),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15.kw),
                                leading: GhuyomRoundedBox(
                                    height: 35.kh,
                                    width: 46.kh,
                                    child: CommonImageView(
                                        url: itemData['image'])),
                                title:
                                    itemData['name'].toString().text600(14.kh),
                                subtitle: itemData['subCategory'] != null
                                    ? Row(
                                        children: [
                                          itemData['category']
                                              .toString()
                                              .text500(10.kh,
                                                  color: ColorUtil.navBarColor),
                                          '●'
                                              .text500(10.kh,
                                                  color:
                                                      ColorUtil.mainColorGrey1)
                                              .paddingSymmetric(
                                                  horizontal: 4.kw),
                                          itemData['subCategory']
                                              .toString()
                                              .text500(10.kh,
                                                  color: ColorUtil.grey),
                                        ],
                                      )
                                    : null,
                              ),
                              Divider(height: 0, thickness: 1.5.kh)
                            ],
                          );
                        },
                        suggestionsCallback: (pattern) async =>
                            await controller.searchedItems(pattern),
                      ),
                      15.kheightBox,
                      if (!Get.find<GetStorageService>().getIsUser)
                        GhuyomRoundedBox(
                            borderRadius: 12.kh,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.6),
                                      BlendMode.darken),
                                  image: AssetImage(ImageConstant.pngLandBack1),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              padding: paddingSymmetric(
                                  horizontal: 26.kw, vertical: 20.kh),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  LocaleKeys.boost_your_business.tr.text600(
                                      16.kh,
                                      color: const Color(0xffC8ECFB)),
                                  LocaleKeys.get_all_the.tr
                                      .text600(14.kh, color: Colors.white),
                                  8.kheightBox,
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GhuyomButton(
                                      onPressed: () =>
                                          controller.onAddMyBusinessTap(),
                                      height: 35.kh,
                                      label: LocaleKeys.add_my_business.tr,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      15.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LocaleKeys.categories.tr.text600(16.kh),
                          GestureDetector(
                            onTap: () => controller.onShowAllLessTap(),
                            child: Obx(
                              () => controller.isShow.value
                                  ? LocaleKeys.show_less.tr.text600(12.kh,
                                      color: ColorUtil.mainColorBlue)
                                  : LocaleKeys.show_all.tr.text600(12.kh,
                                      color: ColorUtil.mainColorBlue),
                            ),
                          ),
                        ],
                      ),
                      13.kheightBox,
                      Row(
                        children: [
                          Expanded(
                              child: CategoryTile(
                                  ImageConstant.pngRestaurant, 'Restaurant')),
                          16.kwidthBox,
                          Expanded(
                              child: CategoryTile(ImageConstant.pngHairSalon,
                                  LocaleKeys.hair_salon.tr)),
                        ],
                      ),
                      13.kheightBox,
                      Row(
                        children: [
                          Expanded(
                              child: CategoryTile(ImageConstant.pngBarberShop,
                                  LocaleKeys.barber_shops.tr)),
                          16.kwidthBox,
                          Expanded(
                              child: CategoryTile(ImageConstant.pngBeauty,
                                  LocaleKeys.beauty_wellness.tr)),
                        ],
                      ),
                      Obx(
                        () => ExpandedSection(
                          expand: controller.isShow.value,
                          child: Column(
                            children: [
                              13.kheightBox,
                              Row(
                                children: [
                                  Expanded(
                                      child: CategoryTile(
                                          ImageConstant.pngClothing,
                                          LocaleKeys.clothing_accessories.tr)),
                                  16.kwidthBox,
                                  Expanded(
                                      child: CategoryTile(ImageConstant.pngGym,
                                          LocaleKeys.fitness_gyms.tr)),
                                ],
                              ),
                              13.kheightBox,
                              Row(
                                children: [
                                  Expanded(
                                      child: CategoryTile(
                                          ImageConstant.pngCleaning,
                                          LocaleKeys.home_cleaning_service.tr)),
                                  16.kwidthBox,
                                  Expanded(
                                      child: CategoryTile(
                                          ImageConstant.pngHomeBusiness,
                                          LocaleKeys.home_based_business.tr)),
                                ],
                              ),
                              13.kheightBox,
                              Row(
                                children: [
                                  Expanded(
                                      child: CategoryTile(
                                          ImageConstant.pngAdventure,
                                          LocaleKeys.adventure_tourism.tr)),
                                  16.kwidthBox,
                                  Expanded(
                                      child: CategoryTile(
                                          ImageConstant.pngLocalGoods,
                                          LocaleKeys.local_goods.tr)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 20.kheightBox,
                      // GhuyomRoundedBox(
                      //     borderRadius: 12.kh,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //           colorFilter: ColorFilter.mode(
                      //               Colors.white.withOpacity(0.8),
                      //               BlendMode.lighten),
                      //           image: AssetImage(ImageConstant.pngLandBack2),
                      //           fit: BoxFit.fill,
                      //         ),
                      //       ),
                      //       padding: paddingSymmetric(
                      //           horizontal: 30.kw, vertical: 15.kh),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.stretch,
                      //         children: [
                      //           '${LocaleKeys.maximize_your_business.tr}\n${LocaleKeys.subscribe_now_for.tr}'
                      //               .text600(16.kh),
                      //           8.kheightBox,
                      //           Align(
                      //             alignment: Alignment.centerLeft,
                      //             child: GhuyomButton(
                      //               color: ColorUtil.mainColorPink,
                      //               onPressed: () {},
                      //               height: 40.kh,
                      //               label: LocaleKeys.subscription_details.tr,
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     )),
                      30.kheightBox
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class ExpandedSection extends StatefulWidget {
  final Widget? child;
  final bool expand;
  const ExpandedSection({super.key, this.expand = false, this.child});

  @override
  ExpandedSectionState createState() => ExpandedSectionState();
}

class ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    Animation<double> curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.ease,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
