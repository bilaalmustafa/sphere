import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/generated/assets.dart';

class AdsContainerCostomWidget extends StatelessWidget {
  const AdsContainerCostomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ConstColors.thirdColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: ConstColors.seconderyColor, width: 2),
          image: DecorationImage(
              image: AssetImage(ImagesAssets.firstImage), fit: BoxFit.fill)),
      child: CustomText(
          titletext: '50 % Off Sell',
          fontsize: 30,
          bold: FontWeight.bold,
          textcolor: ConstColors.primarycolor),
    );
  }
}
