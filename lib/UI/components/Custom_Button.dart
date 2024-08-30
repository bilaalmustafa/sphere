import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttontext,
      required this.buttoncolor,
      required this.btntextcolor,
      required this.onTop});
  final String buttontext;
  final Color buttoncolor;
  final Color btntextcolor;
  final VoidCallback onTop;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTop,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: size.height * 0.065,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: buttoncolor,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                blurStyle: BlurStyle.inner,
                color: ConstColors.customGrey,
                offset: Offset(1, 1)),
          ],
        ),
        child: CustomText(
          titletext: buttontext,
          fontsize: 14,
          bold: FontWeight.bold,
          textcolor: btntextcolor,
        ),
      ),
    );
  }
}
