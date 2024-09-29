import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Bottom_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/generated/assets.dart';

class CongrateScreen extends StatelessWidget {
  const CongrateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(
                ImagesAssets.check,
              ),
              height: size.height * 0.35,
            ),
            CustomText(
                titletext: 'Order ID. #123456',
                fontsize: normalText,
                bold: FontWeight.normal,
                textcolor: ConstColors.customGrey),
            Image(
              image: AssetImage(
                ImagesAssets.gift,
              ),
              height: 50,
            ),
            CustomText(
                titletext: 'Congratulations !',
                fontsize: normalText,
                bold: FontWeight.w600,
                textcolor: ConstColors.blackColor),
            CustomText(
                textalign: TextAlign.center,
                titletext:
                    'You placed the order successfully. You will get your parcel soon. Thanks for using our survices. Enjoy your parcel:)',
                fontsize: smallText,
                bold: FontWeight.normal,
                textcolor: ConstColors.customGrey),
            CustomButton(
                buttontext: 'Back to Home',
                buttoncolor: ConstColors.seconderyColor,
                btntextcolor: ConstColors.primarycolor,
                onTop: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const NevigationBottomScreen();
                  }));
                })
          ],
        ),
      )),
    );
  }
}
