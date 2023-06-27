import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghuyom/app/services/responsive_size.dart';
import '../services/text_style_util.dart';

class GhuyomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final int maxLines;
  final bool? isObscure;
  final String? label;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? hintColor;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final double? radius, hintFont;
  final void Function(String)? onChanged;
  final BoxConstraints? prefixIconConstraints;
  const GhuyomTextField({
    Key? key,
    required this.hint,
    this.isObscure,
    this.maxLength,
    this.suffixIcon,
    this.textInputType,
    this.controller,
    this.maxLines = 1,
    this.prefixIcon,
    this.hintColor,
    this.validator,
    this.readOnly,
    this.onTap,
    this.radius,
    this.label,
    this.onChanged,
    this.prefixIconConstraints,
    this.hintFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label?.isNotEmpty ?? false
            ? Column(
                children: [
                  label!.text500(14.kh),
                  9.kheightBox,
                ],
              )
            : Container(),
        TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly ?? false,
          validator: validator,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength ?? -1),
          ],
          obscureText: isObscure ?? false,
          keyboardType: textInputType,
          maxLines: maxLines,
          style: TextStyleUtil.manrope400(fontSize: 16.kh, color: Colors.black),
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 24.kw, vertical: 12.kh),
            isDense: true,
            prefixIcon: prefixIcon,
            // prefixIconConstraints:
            //     BoxConstraints(minHeight: 20.kh, minWidth: 20.kh),
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: TextStyleUtil.manrope400(
                fontSize: hintFont ?? 16.kh,
                color: hintColor ?? Colors.black.withOpacity(0.5)),
            fillColor: Colors.white,
            filled: true,
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.kh, color: const Color(0xffD8DADC)),
                borderRadius: BorderRadius.circular(radius ?? 10.kh)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.kh, color: const Color(0xffD8DADC)),
                borderRadius: BorderRadius.circular(radius ?? 10.kh)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.kh, color: const Color(0xffD8DADC)),
                borderRadius: BorderRadius.circular(radius ?? 10.kh)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.kh, color: const Color(0xffD8DADC)),
                borderRadius: BorderRadius.circular(radius ?? 10.kh)),
          ),
        ),
      ],
    );
  }
}
