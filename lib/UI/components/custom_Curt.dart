import 'package:flutter/material.dart';
import 'package:sphere/UI/screens/Cart_Screen/CartScreen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomCurt extends StatelessWidget {
  const CustomCurt({
    super.key,
    this.size,
  });
  final double? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (contex) {
          return const CartScreen();
        }));
      },
      child: Icon(
        Icons.shopping_cart,
        color: ConstColors.seconderyColor,
        size: size,
      ),
    );
  }
}
