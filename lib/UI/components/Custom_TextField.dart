import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.title,
      this.icon,
      required this.controller,
      this.length});
  final String title;
  final IconData? icon;
  final TextEditingController controller;
  int? length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: TextField(
        // keyboardType: TextInputType.,
        inputFormatters: [LengthLimitingTextInputFormatter(length)],
        controller: controller,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(horizontal: 30),
          fillColor: ConstColors.thirdColor,
          enabled: true,
          filled: true,
          suffixIcon: Icon(
            icon,
            color: ConstColors.seconderyColor,
          ),
          focusColor: Colors.red,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide()),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: ConstColors.thirdColor,
              )),
          labelText: title,
          labelStyle: TextStyle(
              color: ConstColors.seconderyColor.withOpacity(0.4),
              fontSize: smallText),
        ),
      ),
    );
  }
}
