import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.icon,
    // required this.controller
  });
  final String title;
  final IconData? icon;
  // final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: TextField(
        // keyboardType: TextInputType.,
        // controller: controller,
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
          labelStyle: TextStyle(color: ConstColors.seconderyColor),
        ),
      ),
    );
  }
}
