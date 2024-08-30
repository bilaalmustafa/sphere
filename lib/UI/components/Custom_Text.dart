import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.titletext,
      required this.fontsize,
      required this.bold,
      required this.textcolor,
      this.textalign,
      this.lineThrough});
  final String titletext;
  final double fontsize;
  final FontWeight bold;
  final Color textcolor;
  final TextAlign? textalign;
  final TextDecoration? lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textalign,
      titletext,
      style: GoogleFonts.poppins(
        decoration: lineThrough,
        decorationColor: ConstColors.customGrey,
        fontSize: fontsize,
        fontWeight: bold,
        color: textcolor,
      ),
    );
  }
}
