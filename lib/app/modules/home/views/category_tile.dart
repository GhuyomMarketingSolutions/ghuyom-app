import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../services/index.dart';
import '../controllers/home_controller.dart';

class CategoryTile extends GetView<HomeController> {
  final String pic, label;
  const CategoryTile(this.pic, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return GhuyomRoundedBox(
        onTap: () => controller.onCategoryTileTap(label),
        // height: 13.h,
        // height: 100.kh,
        isBorder: true,
        borderWidth: 0.5.kh,
        borderColor: const Color(0xffD9D9D9),
        borderRadius: 5.kh,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonImageView(
              width: 100.w,
              // height: 65.kh,
              fit: BoxFit.cover,
              imagePath: pic,
            ),
            Container(
                alignment: Alignment.center,
                height: 30.kh,
                // padding: 6.paddingVertical,
                child: AutoSizeText(label,
                    style: TextStyleUtil.manrope500(fontSize: 13.kh),
                    softWrap: true,
                    minFontSize: 5,
                    textAlign: TextAlign.center))
          ],
        ));
  }
}
