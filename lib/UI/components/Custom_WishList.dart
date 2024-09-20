import 'package:flutter/material.dart';

class CustomWishList extends StatelessWidget {
  const CustomWishList({
    super.key,
    required this.icon,
    required this.color,
    required this.bgColor,
    this.boderSide,
  });
  final IconData icon;
  final Color color, bgColor;

  final Border? boderSide;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          border: boderSide,
          color: bgColor,
          borderRadius: BorderRadius.circular(100)),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
