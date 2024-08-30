import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_CartButton.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_WishList.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/generated/assets.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
    super.key,
    required this.size,
    required this.condition,
  });
  final String condition;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.5,
          // mainAxisSpacing: 10 //,
          //crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      blurStyle: BlurStyle.normal,
                      color: ConstColors.customGrey,
                      offset: Offset(0, 0)),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                        //height: 155,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            //  color: Colors.orange,

                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            image: DecorationImage(
                                image: AssetImage(ImagesAssets.scondImage),
                                fit: BoxFit.fill)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomWishList(
                                bgColor:
                                    ConstColors.primarycolor.withOpacity(.5),
                                icon: condition == 'StoreProfileScreen'
                                    ? Icons.more_vert_outlined
                                    : Icons.favorite_border_outlined,
                                color: ConstColors.seconderyColor,
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ConstColors.primarycolor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                      titletext: 'Shoe',
                                      fontsize: 18,
                                      bold: FontWeight.bold,
                                      textcolor: ConstColors.seconderyColor),
                                  CustomText(
                                      titletext: '\$ 23.98',
                                      fontsize: 15,
                                      bold: FontWeight.normal,
                                      textcolor: ConstColors.seconderyColor),
                                ],
                              ),
                            ),
                            condition == 'StoreProfileScreen'
                                ? Container()
                                : CustomCartButton(size: size),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
