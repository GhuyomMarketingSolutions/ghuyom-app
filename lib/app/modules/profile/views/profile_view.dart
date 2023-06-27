import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/index.dart';
import '../../../components/ghuyom_appbar.dart';
import '../../../services/colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GhuyomAppbar(
          centerTitle: true,
          isLeading: false,
          title: LocaleKeys.my_profile.tr,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(
              height: 1.kh,
              thickness: 1.kh,
              color: const Color(0xffd9d9d9),
            ),
            40.kheightBox,
            Column(
              children: List.generate(controller.data.length - 2, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: 20.paddingHorizontal,
                      child: ListTile(
                        onTap: () => controller.onListElementTap(index),
                        leading: CommonImageView(
                          height: 24.kh,
                          width: 24.kh,
                          svgPath: controller.data[index]['icon'],
                        ),
                        title: controller.data[index]['label']?.text400(16.kh),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 17.kh,
                          color: ColorUtil.mainColorBlue,
                        ),
                      ),
                    ),
                    Divider(
                      color: const Color(0xfff1f1f1),
                      thickness: 1.kh,
                    )
                  ],
                );
              }),
            ),
            47.kheightBox,
            Divider(
              color: const Color(0xfff1f1f1),
              thickness: 1.kh,
            ),
            Padding(
              padding: 20.paddingHorizontal,
              child: ListTile(
                onTap: () => controller.onListElementTap(3),
                leading: CommonImageView(
                  height: 24.kh,
                  width: 24.kh,
                  svgPath: controller.data[3]['icon'],
                ),
                title: controller.data[3]['label']?.text400(16.kh),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.kh,
                  color: ColorUtil.mainColorPink,
                ),
              ),
            ),
            Divider(
              color: const Color(0xfff1f1f1),
              thickness: 1.kh,
            ),
            Padding(
              padding: 20.paddingHorizontal,
              child: ListTile(
                onTap: () => controller.onListElementTap(4),
                leading: CommonImageView(
                  height: 24.kh,
                  width: 24.kh,
                  svgPath: controller.data[4]['icon'],
                ),
                title: controller.data[4]['label']?.text400(16.kh),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 17.kh,
                  color: ColorUtil.mainColorPink,
                ),
              ),
            ),
            Divider(
              color: const Color(0xfff1f1f1),
              thickness: 1.kh,
            ),
            Padding(
              padding: 20.paddingHorizontal,
              child: ListTile(
                onTap: () => controller.onLogoutTap(),
                leading: Icon(Icons.logout, color: Colors.red),
                title: LocaleKeys.logout.text400(16.kh, color: Colors.red),
              ),
            ),
            Divider(
              color: const Color(0xfff1f1f1),
              thickness: 1.kh,
            )
          ],
        ));
  }
}
