import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class ProductDerailScreen extends StatelessWidget {
  const ProductDerailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagesAssets.firstImage), fit: BoxFit.fill),
            ),
          ),
          CustomText(
              titletext: storeName,
              fontsize: 18,
              bold: FontWeight.normal,
              textcolor: ConstColors.customGrey),
          CustomText(
              titletext: 'Clothes Collection',
              fontsize: 18,
              bold: FontWeight.bold,
              textcolor: ConstColors.blackColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  titletext: '\$30.99',
                  fontsize: 18,
                  bold: FontWeight.bold,
                  textcolor: ConstColors.seconderyColor),
              CustomText(
                titletext: '\$33.99',
                fontsize: 16,
                bold: FontWeight.normal,
                textcolor: ConstColors.customGrey,
                lineThrough: TextDecoration.lineThrough,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                  titletext: 'Size: ',
                  fontsize: 16,
                  bold: FontWeight.normal,
                  textcolor: ConstColors.blackColor),
              CustomSizingContainer(
                color: ConstColors.primarycolor,
                text: 'S',
                txtcolor: ConstColors.blackColor,
              ),
              CustomSizingContainer(
                color: ConstColors.primarycolor,
                text: 'M',
                txtcolor: ConstColors.blackColor,
              ),
              CustomSizingContainer(
                color: ConstColors.primarycolor,
                text: 'L',
                txtcolor: ConstColors.blackColor,
              ),
              CustomSizingContainer(
                color: ConstColors.seconderyColor,
                text: 'XL',
                txtcolor: ConstColors.primarycolor,
              ),
            ],
          ),
          Divider(
            color: ConstColors.seconderyColor,
            thickness: 2,
          ),
          CustomText(
              titletext: 'Description',
              fontsize: 16,
              bold: FontWeight.normal,
              textcolor: ConstColors.blackColor),
        ],
      ),
    );
  }
}

class CustomSizingContainer extends StatelessWidget {
  const CustomSizingContainer({
    super.key,
    required this.color,
    required this.text,
    required this.txtcolor,
  });
  final Color color, txtcolor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: ConstColors.customGrey, width: 2)),
        child: CustomText(
            titletext: text,
            fontsize: 20,
            bold: FontWeight.bold,
            textcolor: txtcolor),
      ),
    );
  }
}
