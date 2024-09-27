import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/CustomAppbarText.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_WishList.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Chats_Screens/Wishlist_Controller.dart';

import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColors.primarycolor,
        appBar: AppBar(
          centerTitle: true,
          title: const CustomAppbarText(
            text: 'WISHLIST',
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: ConstColors.primarycolor),
          ),
          // backgroundColor: ConstColors.primarycolor,
          actions: const [
            CustomCurt(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Consumer<WishlistProvider>(
            builder: (context, vm, child) => ListView.builder(
                  itemCount: vm.wishlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: ConstColors.thirdColor.withOpacity(0.5),
                            border: Border.all(
                                color: ConstColors.customGrey.withOpacity(0.2)),
                          ),
                          // color: Colors.amber,
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                // color: Colors.black,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ConstColors.customGrey
                                            .withOpacity(0.2)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            vm.wishlist[index].image),
                                        fit: BoxFit.cover)),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          titletext:
                                              vm.wishlist[index].shopname,
                                          fontsize: smallText,
                                          bold: FontWeight.w500,
                                          textcolor: ConstColors.customGrey),
                                      CustomText(
                                          titletext:
                                              '${vm.wishlist[index].itemname}',
                                          fontsize: normalText,
                                          bold: FontWeight.w600,
                                          textcolor:
                                              ConstColors.seconderyColor),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CustomWishList(
                                  boderSide:
                                      Border.all(color: ConstColors.blackColor),
                                  icon: Icons.favorite_border_outlined,
                                  color: ConstColors.blackColor,
                                  bgColor:
                                      ConstColors.primarycolor.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                )));
  }
}
