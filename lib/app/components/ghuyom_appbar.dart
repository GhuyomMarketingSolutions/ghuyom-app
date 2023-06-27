import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghuyom/app/services/responsive_size.dart';

import '../services/text_style_util.dart';

class GhuyomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool isLeading, centerTitle;
  final String title;
  final void Function()? onPressed;
  final Widget? leadChild;

  const GhuyomAppbar({
    Key? key,
    this.actions,
    this.isLeading = true,
    required this.title,
    this.onPressed,
    this.leadChild,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      title: Text(
        title,
        textAlign: TextAlign.start,
        //TODO
        style: TextStyleUtil.manrope600(fontSize: 18.kh),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: isLeading
          ? leadChild ??
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: onPressed ?? () => Get.back(),
              )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.kh);
}
