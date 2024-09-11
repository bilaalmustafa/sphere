import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/Cart_Screen/CartScreen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

import '../screens/Cart_Screen/Cart_Provider.dart';

class CustomCurt extends StatelessWidget {
  const CustomCurt({
    super.key,
    this.size,
  });
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, vm, child) {
        return IconButton(
          icon: Badge.count(
            count: vm.cart.length,
            child: Icon(
              Icons.shopping_cart,
              color: ConstColors.seconderyColor,
              size: size,
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (contex) {
              return const CartScreen();
            }));
          },
        );
      },
    );
  }
}
