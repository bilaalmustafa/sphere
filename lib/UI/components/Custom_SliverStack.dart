import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_RatingWidget.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class CustomSliverStack extends StatelessWidget {
  const CustomSliverStack({
    super.key,
    required this.size,
    required this.condition,
    this.shadowclr,
  });
  final String condition;
  final Size size;
  final Color? shadowclr;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: size.height * 0.28,
      // toolbarHeight: 60,
      //floating: true,
      stretch: true,
      elevation: 10,
      shadowColor: shadowclr,
      scrolledUnderElevation: 1,
      automaticallyImplyLeading: true,
      backgroundColor: ConstColors.primarycolor,

      pinned: true,

      leading:
          condition == 'StoreProfileScreen' ? null : const CustomLeadingBack(),
      actions: [
        condition == 'StoreProfileScreen'
            ? Icon(
                Icons.more_vert_outlined,
                color: ConstColors.seconderyColor,
              )
            : const CustomCurt(),
        const SizedBox(
          width: 10,
        )
      ],

      // backgroundColor: Colors.amber,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.09,
          ),
          child: Stack(
            children: [
              //first
              Container(
                //alignment: Alignment.topRight,
                height: size.height * 0.3,
                width: size.width * 0.8,
                color: ConstColors.seconderyColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                titletext: storeName,
                                fontsize: size.width * .04,
                                bold: FontWeight.bold,
                                textcolor: ConstColors.primarycolor),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                                titletext: description,
                                fontsize: size.width * .025,
                                bold: FontWeight.normal,
                                textcolor: ConstColors.primarycolor),
                            const Spacer(),
                            const CustonRatingWidget(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 3, child: Container())
                  ],
                ),
              ),
              //second
              Positioned(
                right: size.width * 0.02,
                top: size.height * 0.035,
                child: Container(
                  height: size.height * 0.2,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    color: ConstColors.primarycolor,
                    image: DecorationImage(
                        image: AssetImage(ImagesAssets.forthImage),
                        fit: BoxFit.fill),
                    border:
                        Border.all(color: ConstColors.primarycolor, width: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
