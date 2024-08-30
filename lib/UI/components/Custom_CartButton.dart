import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.05,
      width: 50,
      decoration: BoxDecoration(
          color: ConstColors.seconderyColor,
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(20))),
      child: Icon(
        Icons.shopping_cart,
        size: 15,
        color: ConstColors.primarycolor,
      ),
    );
  }
}
