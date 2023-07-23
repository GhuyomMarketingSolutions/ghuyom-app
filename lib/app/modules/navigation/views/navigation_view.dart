import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/modules/business/views/business_view.dart';
import 'package:ghuyom/app/services/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../services/index.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  final List<Widget> pages = const [
    HomeView(),
    BusinessView(),
    // FavouritesView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            //  PageView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   controller: controller.pageViewController,
            //   children: pages,
            // ),
            // bottomNavigationBar:

            PersistentTabView(
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
        PersistentBottomNavBarItem(
          activeColorPrimary: ColorUtil.navBarColor,
          inactiveIcon: CommonImageView(
            fit: BoxFit.contain,
            svgPath: ImageConstant.svgBusinessOff,
            height: 21.kh,
            width: 21.kh,
          ),
          icon: CommonImageView(
            fit: BoxFit.contain,
            svgPath: ImageConstant.svgBusinessOn,
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
// Container(
//               decoration: BoxDecoration(boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   offset: const Offset(0, -15),
//                   blurRadius: 15,
//                   spreadRadius: 0,
//                 ),
//               ]),
//               height: 76.kh,
//               child: BottomNavigationBar(
//                 backgroundColor: Colors.white,
//                 type: BottomNavigationBarType.fixed,
//                 // selectedItemColor: ColorUtil.selectedLabel,
//                 // unselectedItemColor: ColorUtil.unSelectedLabel,
//                 selectedLabelStyle: TextStyleUtil.manrope600(fontSize: 12.kh),
//                 unselectedLabelStyle: TextStyleUtil.manrope600(fontSize: 12.kh),
//                 currentIndex: controller.pageNo.value,
//                 onTap: (value) => controller.onIconTap(value),
//                 items: [
//                   BottomNavigationBarItem(
//                     label: '',
//                     icon: CommonImageView(
//                       svgPath: ImageConstant.svgHomeOff,
//                       height: 21.kh,
//                       width: 21.kh,
//                     ),
//                     activeIcon: CommonImageView(
//                       svgPath: ImageConstant.svgHomeOn,
//                       height: 21.kh,
//                       width: 21.kh,
//                     ),
//                   ),
//                   BottomNavigationBarItem(
//                     label: '',
//                     icon: CommonImageView(
//                       svgPath: ImageConstant.svgBusinessOff,
//                       height: 21.kh,
//                       width: 21.kh,
//                     ),
//                     activeIcon: CommonImageView(
//                       svgPath: ImageConstant.svgBusinessOn,
//                       height: 21.kh,
//                       width: 21.kh,
//                     ),
//                   ),
//                   BottomNavigationBarItem(
//                     label: '',
//                     icon: CommonImageView(
//                       svgPath: ImageConstant.svgFavouritesOff,
//                       height: 24.kh,
//                       width: 24.kh,
//                     ),
//                     activeIcon: CommonImageView(
//                       svgPath: ImageConstant.svgFavouritesOff,
//                       height: 24.kh,
//                       width: 24.kh,
//                     ),
//                   ),
//                   BottomNavigationBarItem(
//                     label: '',
//                     icon: CommonImageView(
//                       svgPath: ImageConstant.svgProfileOff,
//                       height: 24.kh,
//                       width: 24.kh,
//                     ),
//                     activeIcon: CommonImageView(
//                       svgPath: ImageConstant.svgProfileOn,
//                       height: 24.kh,
//                       width: 24.kh,
//                     ),
//                   ),
//                 ],
//                 elevation: 0,
//               ),
//             ),
