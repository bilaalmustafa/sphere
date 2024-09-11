import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomAppbarText extends StatelessWidget {
  const CustomAppbarText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.bebasNeue(
          color: ConstColors.seconderyColor, fontSize: 25),
    );
  }
}
