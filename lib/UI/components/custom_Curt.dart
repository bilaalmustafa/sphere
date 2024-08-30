import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomCurt extends StatelessWidget {
  const CustomCurt({
    super.key,
    this.size,
  });
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.shopping_cart,
      color: ConstColors.seconderyColor,
      size: size,
    );
  }
}
