import 'package:flutter/material.dart';
import 'package:ghuyom/app/services/responsive_size.dart';

import '../services/text_style_util.dart';
import '../services/colors.dart';

class GhuyomButton extends StatelessWidget {
  final bool isActive;
  final bool isBorder;
  final bool isLoading;
  final String? label;
  final double? width, fontSize, height, borderRadius, borderWidth;
  final Function() onPressed;
  final Widget? child;
  final Color? color, borderColor, labelColor;
  const GhuyomButton({
    Key? key,
    this.label,
    this.borderRadius,
    this.fontSize,
    required this.onPressed,
    this.width,
    this.color,
    this.child,
    this.height,
    this.isActive = true,
    this.isBorder = false,
    this.borderWidth,
    this.borderColor,
    this.isLoading = false,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.kh,
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color ??
              (isActive ? ColorUtil.mainColorBlue : ColorUtil.mainColorGrey),
          shape: RoundedRectangleBorder(
              side: isBorder
                  ? BorderSide(
                      color: borderColor ?? const Color(0xFF000000),
                      width: borderWidth ?? 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 8.kh)),
        ),
        child: isLoading
            ? isActive
                ? SizedBox(
                    height: 20.kh,
                    width: 20.kh,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : SizedBox(
                    height: 20.kh,
                    width: 20.kh,
                    child: const CircularProgressIndicator(
                      color: ColorUtil.mainColorBlue,
                    ),
                  )
            : child ??
                Text(label ?? '',
                    style: TextStyleUtil.manrope600(
                        fontSize: fontSize ?? 14.kh,
                        color: labelColor ?? Colors.white)),
      ),
    );
  }
}
