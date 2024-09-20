import 'package:flutter/material.dart';
import 'package:draggable_carousel_slider/draggable_carousel_slider.dart';
import 'package:sphere/UI/components/CustomImage_Container.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //  appBar: AppBar(),
      backgroundColor: ConstColors.primarycolor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DraggableSlider(loop: true, children: [
                CostumImageContainer(
                  image: ImagesAssets.firstImage,
                ),
                CostumImageContainer(image: ImagesAssets.scondImage),
                CostumImageContainer(image: ImagesAssets.thirdImage),
                CostumImageContainer(image: ImagesAssets.forthImage),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              child: CustomText(
                titletext: dragSliderText,
                fontsize: size.width * 0.06,
                bold: FontWeight.bold,
                textcolor: ConstColors.blackColor,
                textalign: TextAlign.center,
              ),
            ),
            CustomText(
              titletext: dragSliderSmallText,
              fontsize: 13,
              bold: FontWeight.normal,
              textcolor: ConstColors.blackColor,
              textalign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: CustomButton(
                onTop: () => Navigator.pushNamed(context, '/LoginScreen'),
                buttontext: logIn,
                btntextcolor: ConstColors.primarycolor,
                buttoncolor: ConstColors.seconderyColor,
              ),
            ),
            CustomButton(
              onTop: () {
                Navigator.pushNamed(context, '/SignupScreen');
              },
              buttontext: signUp,
              btntextcolor: ConstColors.blackColor,
              buttoncolor: ConstColors.thirdColor,
            ),
          ],
        ),
      ),
    );
  }
}
