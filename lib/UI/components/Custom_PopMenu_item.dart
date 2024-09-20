import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class CustomPopMenuItem extends StatelessWidget {
  const CustomPopMenuItem(
      {super.key, required this.text, required this.icon, required this.color});

  final String text;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(icon, color: color),
        CustomText(
            titletext: text,
            fontsize: normalText,
            bold: FontWeight.w500,
            textcolor: ConstColors.blackColor)
      ],
    );
  }
}
