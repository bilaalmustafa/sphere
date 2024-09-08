import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sphere/UI/components/Custom_CartButton.dart';
import 'package:sphere/UI/components/Custom_SendButton.dart';
import 'package:sphere/UI/components/Custom_ShopNowButton.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_WishList.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/UI/screens/Products_DetialScreen/ProductDetailScreen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ConstColors.primarycolor,
        appBar: AppBar(
          // shadowColor: ConstColors.blackColor,
          // elevation: 5,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: ConstColors.primarycolor),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'BrandSphere',
            style: GoogleFonts.permanentMarker(
                color: ConstColors.seconderyColor, fontSize: 25),
          ),
          actions: [
            Icon(
              Icons.search,
              color: ConstColors.seconderyColor,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const CustomCurt(
              size: 23,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 3.1,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProductDerailScreen();
                    }));
                  },
                  child: Container(
                    // color: Colors.amberAccent,
                    decoration: BoxDecoration(
                        color: ConstColors.primarycolor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              blurStyle: BlurStyle.normal,
                              color: ConstColors.customGrey,
                              offset: Offset(0, 0))
                        ]),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage(ImagesAssets.forthImage),
                                fit: BoxFit.fill),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomWishList(
                                      boderSide: Border.all(
                                          color: ConstColors.blackColor),
                                      icon: Icons.favorite_border_outlined,
                                      color: ConstColors.blackColor,
                                      bgColor: ConstColors.primarycolor
                                          .withOpacity(.5),
                                    ),
                                    CustomWishList(
                                      boderSide: Border.all(
                                          color: ConstColors.blackColor),
                                      icon: Icons.share,
                                      color: ConstColors.blackColor,
                                      bgColor: ConstColors.primarycolor
                                          .withOpacity(.5),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                    titletext: storeName,
                                    fontsize: 13,
                                    bold: FontWeight.normal,
                                    textcolor: ConstColors.customGrey),
                                CustomText(
                                    titletext: 'Shoes',
                                    fontsize: 16,
                                    bold: FontWeight.normal,
                                    textcolor: ConstColors.blackColor),
                                CustomText(
                                    titletext: '\$ 300.0',
                                    fontsize: 16,
                                    bold: FontWeight.bold,
                                    textcolor: ConstColors.seconderyColor),
                                const ShopNowButton(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
