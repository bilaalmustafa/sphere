import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_text.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ConstColors.seconderyColor.withOpacity(.7),
          border: Border.all(color: ConstColors.seconderyColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
            titletext: shopNow,
            fontsize: 12,
            bold: FontWeight.bold,
            textcolor: ConstColors.primarycolor));
  }
}
