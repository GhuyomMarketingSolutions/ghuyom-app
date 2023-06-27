import 'package:ghuyom/app/services/index.dart';
import 'package:flutter/material.dart';

class GhuyomDropDown extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic)? onChanged;
  final dynamic value;
  const GhuyomDropDown({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 48.kh,
      alignedDropdown: true,
      child: SizedBox(
        // height: 49.kh,
        child: Center(
          child: DropdownButton(
            underline: Container(),
            // autovalidateMode: AutovalidateMode.always,
            style: TextStyleUtil.manrope400(
                fontSize: 14.kh, color: const Color(0xff969696)),
            itemHeight: null,
            isExpanded: true,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 18.kh,
            ),
            borderRadius: BorderRadius.circular(4.kh),
            iconSize: 25,
            items: items,
            onChanged: onChanged,
            value: value,
          ),
        ),
      ),
    );
  }
}
