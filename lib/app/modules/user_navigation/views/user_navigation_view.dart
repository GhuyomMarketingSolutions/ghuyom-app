import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../services/colors.dart';
import '../../../services/index.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/user_navigation_controller.dart';

class UserNavigationView extends GetView<UserNavigationController> {
  const UserNavigationView({Key? key}) : super(key: key);
  final List<Widget> pages = const [
    HomeView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      controller: controller.pageViewController,
      context,
      navBarStyle: NavBarStyle.style14,
      screens: pages,
      // navBarHeight: 76.kh,
      decoration: NavBarDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, -15),
          blurRadius: 15,
          spreadRadius: 0,
        ),
      ]),
      items: [
        PersistentBottomNavBarItem(
          activeColorPrimary: ColorUtil.navBarColor,
          inactiveIcon: CommonImageView(
            fit: BoxFit.contain,
            svgPath: ImageConstant.svgHomeOff,
            height: 21.kh,
            width: 21.kh,
          ),
          icon: CommonImageView(
            fit: BoxFit.contain,
            svgPath: ImageConstant.svgHomeOn,
            height: 21.kh,
            width: 21.kh,
          ),
        ),

        // PersistentBottomNavBarItem(
        //   activeColorPrimary: ColorUtil.navBarColor,
        //   inactiveIcon: CommonImageView(
        //     fit: BoxFit.contain,
        //     svgPath: ImageConstant.svgFavouritesOff,
        //     height: 24.kh,
        //     width: 24.kh,
        //   ),
        //   icon: CommonImageView(
        //     fit: BoxFit.contain,
        //     svgPath: ImageConstant.svgFavouritesOn,
        //     height: 24.kh,
        //     width: 24.kh,
        //   ),
        // ),
        PersistentBottomNavBarItem(
          activeColorPrimary: ColorUtil.navBarColor,
          inactiveIcon: CommonImageView(
            fit: BoxFit.contain,
            svgPath: ImageConstant.svgProfileOff,
            height: 24.kh,
            width: 24.kh,
          ),
          icon: CommonImageView(
            fit: BoxFit.contain,
            svgPath: ImageConstant.svgProfileOn,
            height: 24.kh,
            width: 24.kh,
          ),
        )
      ],
    ));
  }
}
