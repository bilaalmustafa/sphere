import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.title,
      this.icon,
      required this.controller,
      this.length,
      this.onChange,
      required this.obscure,
      this.onTap});
  final String title;
  final IconData? icon;
  final TextEditingController controller;
  final ValueChanged? onChange;
  final bool obscure;
  final VoidCallback? onTap;
  int? length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: TextField(
        obscureText: obscure,

        onChanged: onChange,
        // keyboardType: TextInputType.,
        inputFormatters: [LengthLimitingTextInputFormatter(length)],
        controller: controller,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(horizontal: 30),
          fillColor: ConstColors.thirdColor,
          enabled: true,
          filled: true,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              icon,
              color: ConstColors.seconderyColor,
            ),
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
