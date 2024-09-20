import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/generated/assets.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primarycolor,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: ConstColors.primarycolor),
        ),
        backgroundColor: ConstColors.primarycolor,
        leading: const CustomLeadingBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CustomText(
                      titletext: 'Order ID:',
                      fontsize: smallText,
                      bold: FontWeight.normal,
                      textcolor: ConstColors.customGrey),
                  CustomText(
                      titletext: '# 0001',
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor),
                  Spacer(),
                  Icon(
                    Icons.timelapse_rounded,
                    color: ConstColors.blackColor,
                    size: 10,
                  ),
                  CustomText(
                      titletext: ' 21 0ct 2024',
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor),
                ],
              ),
              Divider(
                color: ConstColors.customGrey.withOpacity(0.3),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomText(
                    titletext: 'Deliver',
                    fontsize: smallText,
                    bold: FontWeight.w500,
                    textcolor: ConstColors.blackColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'Name:',
                      fontsize: smallText,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
                  CustomText(
                      titletext: 'Bilal mustafa',
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'Phone no:',
                      fontsize: smallText,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
                  CustomText(
                      titletext: '030000000',
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'Address:',
                      fontsize: smallText,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomText(
                        titletext:
                            'Peshawar, Shami road, hassan garhi, street no 3 atta ullah',
                        fontsize: smallText,
                        bold: FontWeight.w500,
                        textcolor: ConstColors.blackColor),
                  ),
                ],
              ),
              Divider(
                color: ConstColors.customGrey.withOpacity(0.3),
              ),
              CustomText(
                  titletext: 'Items',
                  fontsize: smallText,
                  bold: FontWeight.w500,
                  textcolor: ConstColors.blackColor),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: ConstColors.primarycolor,
                          backgroundImage: AssetImage(ImagesAssets.firstImage),
                        ),
                        title: CustomText(
                            titletext: 'Shoes ',
                            fontsize: smallText,
                            bold: FontWeight.w500,
                            textcolor: ConstColors.seconderyColor),
                        trailing: CustomText(
                            titletext: '\$ 300.00',
                            fontsize: smallText,
                            bold: FontWeight.w500,
                            textcolor: ConstColors.blackColor),
                      ),
                    );
                  }),
              Divider(
                color: ConstColors.customGrey.withOpacity(0.3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'SubTotal',
                      fontsize: smallText,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
                  CustomText(
                      titletext: '\$ 1200.00',
                      fontsize: smallText,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'Delivery Fee',
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor.withOpacity(0.8)),
                  CustomText(
                      titletext: '(+) \$ 200.00',
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor.withOpacity(0.8)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'Tax',
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor.withOpacity(0.8)),
                  CustomText(
                      titletext: '(-) \$ 00.00',
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor.withOpacity(0.8)),
                ],
              ),
              Divider(
                color: ConstColors.customGrey.withOpacity(0.3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'Total',
                      fontsize: smallText,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
                  CustomText(
                      titletext: '\$ 1400.00',
                      fontsize: smallText,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomButton(
                    buttontext: 'Check now',
                    buttoncolor: ConstColors.seconderyColor,
                    btntextcolor: ConstColors.primarycolor,
                    onTop: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
