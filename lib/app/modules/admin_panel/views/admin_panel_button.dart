import 'package:flutter/material.dart';
import 'package:ghuyom/app/services/responsive_size.dart';



class AdminPanelButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const AdminPanelButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 35.kh,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              // backgroundColor: ColorUtil.mainColor1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.kh)),
            ),
            child: Text(
              label,
              // style: TextStyleUtil.genSans600(
              //     fontSize: 16.kh, color: Colors.white),
            ),
          ),
        ),
        5.kheightBox
      ],
    );
  }
}
