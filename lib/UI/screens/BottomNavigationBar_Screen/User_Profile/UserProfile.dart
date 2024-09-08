import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/generated/assets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primarycolor,
      appBar: AppBar(
        backgroundColor: ConstColors.primarycolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(ImagesAssets.firstImage),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
                titletext: 'M Bilal',
                fontsize: normalText,
                bold: FontWeight.bold,
                textcolor: ConstColors.seconderyColor),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomText(
                  titletext: 'Example@gmail.com',
                  fontsize: smallText,
                  bold: FontWeight.normal,
                  textcolor: ConstColors.customGrey),
            ),
            Divider(
              color: ConstColors.customGrey.withOpacity(0.2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'Contat no',
                      fontsize: normalText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor),
                  CustomText(
                      titletext: '030022222222',
                      fontsize: smallText,
                      bold: FontWeight.normal,
                      textcolor: ConstColors.customGrey),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    titletext: 'Address',
                    fontsize: normalText,
                    bold: FontWeight.w500,
                    textcolor: ConstColors.blackColor),
                CustomText(
                    titletext: ' Street no 2, Shami road, peshawar',
                    fontsize: smallText,
                    bold: FontWeight.normal,
                    textcolor: ConstColors.customGrey),
              ],
            )
          ],
        ),
      ),
    );
  }
}
