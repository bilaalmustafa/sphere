import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_text.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({
    super.key,
    required this.onTop,
  });
  final VoidCallback onTop;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTop,
      child: Container(
          height: size.height * 0.035,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ConstColors.seconderyColor.withOpacity(.7),
            border: Border.all(color: ConstColors.seconderyColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomText(
              titletext: shopNow,
              fontsize: 10,
              bold: FontWeight.bold,
              textcolor: ConstColors.primarycolor)),
    );
  }
}
