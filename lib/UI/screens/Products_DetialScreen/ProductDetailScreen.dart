import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_RatingWidget.dart';
import 'package:sphere/UI/components/Custom_SizeContainers.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class ProductDerailScreen extends StatelessWidget {
  const ProductDerailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 28,
        actions: const [
          CustomCurt(),
          SizedBox(
            width: 12,
          )
        ],
        // backgroundColor: ConstColors.seconderyColor,
        // bottom: PreferredSize(preferredSize: preferredSize, child: child),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(ImagesAssets.firstImage),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: storeName,
                      fontsize: normalText,
                      bold: FontWeight.normal,
                      textcolor: ConstColors.customGrey),
                  const CustonRatingWidget(),
                ],
              ),
            ),
            Row(
              children: [
                CustomText(
                    titletext: 'Clothes Collection',
                    fontsize: Heading2,
                    bold: FontWeight.bold,
                    textcolor: ConstColors.blackColor),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    titletext: '\$30.99',
                    fontsize: Heading1,
                    bold: FontWeight.bold,
                    textcolor: ConstColors.seconderyColor),
                CustomText(
                  titletext: '\$33.99',
                  fontsize: Heading2,
                  bold: FontWeight.normal,
                  textcolor: ConstColors.customGrey,
                  lineThrough: TextDecoration.lineThrough,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  CustomText(
                      titletext: 'Size: ',
                      fontsize: normalText,
                      bold: FontWeight.normal,
                      textcolor: ConstColors.blackColor),
                  CustomSizingContainer(
                    size: size,
                    color: ConstColors.primarycolor,
                    text: 'S',
                    txtcolor: ConstColors.blackColor,
                  ),
                  CustomSizingContainer(
                    size: size,
                    color: ConstColors.primarycolor,
                    text: 'M',
                    txtcolor: ConstColors.blackColor,
                  ),
                  CustomSizingContainer(
                    size: size,
                    color: ConstColors.primarycolor,
                    text: 'L',
                    txtcolor: ConstColors.blackColor,
                  ),
                  CustomSizingContainer(
                    size: size,
                    color: ConstColors.seconderyColor,
                    text: 'XL',
                    txtcolor: ConstColors.primarycolor,
                  ),
                  Spacer(),
                  Container(
                    height: 25,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ConstColors.seconderyColor.withOpacity(0.1),
                        border: Border.all(color: ConstColors.seconderyColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: CustomText(
                        titletext: 'in Stock',
                        fontsize: normalText,
                        bold: FontWeight.w500,
                        textcolor: ConstColors.seconderyColor),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: CustomText(
                      titletext: 'Description',
                      fontsize: Heading2,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.seconderyColor),
                ),
                Divider(
                  color: ConstColors.customGrey.withOpacity(0.5),
                  thickness: 2,
                ),
                Container(
                  child: CustomText(
                      titletext:
                          ' You can use the exists property of the DocumentSnapshot to check if the document exists.',
                      fontsize: smallText,
                      bold: FontWeight.normal,
                      textcolor: ConstColors.blackColor),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
                buttontext: 'Add to Cart',
                buttoncolor: ConstColors.seconderyColor,
                btntextcolor: ConstColors.primarycolor,
                onTop: () {}),
          ],
        ),
      ),
    );
  }
}
