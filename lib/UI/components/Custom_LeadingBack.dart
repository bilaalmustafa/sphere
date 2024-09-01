import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomLeadingBack extends StatelessWidget {
  const CustomLeadingBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: ConstColors.seconderyColor,
      ),
    );
  }
}
