import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class CustomSizingContainer extends StatelessWidget {
  const CustomSizingContainer({
    super.key,
    required this.color,
    required this.text,
    required this.txtcolor,
    required this.size,
    required this.onTop,
  });
  final Color color, txtcolor;
  final String text;
  final Size size;
  final VoidCallback onTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTop,
        child: Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(
                  color: ConstColors.customGrey.withOpacity(0.5), width: 2)),
          child: CustomText(
              titletext: text,
              fontsize: normalText,
              bold: FontWeight.bold,
              textcolor: txtcolor),
        ),
      ),
    );
  }
}
