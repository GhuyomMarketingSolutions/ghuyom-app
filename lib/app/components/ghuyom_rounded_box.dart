import 'package:flutter/material.dart';
import 'package:ghuyom/app/services/responsive_size.dart';

class GhuyomRoundedBox extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  final Color borderColor;
  final double? borderRadius, height, width, borderWidth;
  final Widget child;
  final bool isBorder;
  const GhuyomRoundedBox({
    Key? key,
    this.onTap,
    this.color = Colors.white,
    this.height,
    this.width,
    this.borderRadius,
    this.borderColor = Colors.transparent,
    required this.child,
    this.isBorder = false,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.kh),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.kh),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 8.kh),
              border: isBorder
                  ? Border.all(width: borderWidth ?? 1.5.kh, color: borderColor)
                  : Border.all(width: 0, color: Colors.transparent),
              color: color,
            ),
            child: child,
          ),
        ));
  }
}
