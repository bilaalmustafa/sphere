import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/screens/auth/logIn_Screen/LognIn_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class BuyerScreen extends StatelessWidget {
  const BuyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstColors.primarycolor,
      appBar: AppBar(
        leading: const CustomLeadingBack(),
        backgroundColor: ConstColors.primarycolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            CircleAvatar(
              backgroundColor: ConstColors.thirdColor,
              radius: 60,
              child: Icon(
                Icons.camera_alt_outlined,
                size: 40,
                color: ConstColors.primarycolor,
              ),
            ),
            CustomText(
                titletext: 'Select Profile',
                fontsize: smallText,
                bold: FontWeight.normal,
                textcolor: ConstColors.seconderyColor),
            SizedBox(
              height: size.height * 0.06,
            ),
            const CustomTextField(title: 'Phone no'),
            const CustomTextField(title: 'Deliver adress'),
            SizedBox(
              height: size.height * 0.08,
            ),
            CustomButton(
                buttontext: 'Confirm',
                buttoncolor: ConstColors.seconderyColor,
                btntextcolor: ConstColors.primarycolor,
                onTop: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                })
          ],
        ),
      ),
    );
  }
}
