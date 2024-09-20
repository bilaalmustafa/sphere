import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/CustomAppbarText.dart';
import 'package:sphere/UI/components/Custom_Drawer.dart';
import 'package:sphere/UI/components/Custom_ShopNowButton.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_WishList.dart';
import 'package:sphere/UI/components/Shimmer/Shimmerfeeds.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Feeds_Screens/Feeds_Controller.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final feedScreenProvider =
        Provider.of<FeedScreenProvider>(context, listen: false);
    return Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: ConstColors.primarycolor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: ConstColors.seconderyColor),
          // leading: IconButton(
          //   onPressed: () {
          //     Scaffold.of(context).openDrawer();
          //   },
          //   icon: Icon(
          //     Icons.menu_sharp,
          //     color: ConstColors.seconderyColor,
          //   ),
          // ),
          // shadowColor: ConstColors.blackColor,
          // elevation: 5,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: ConstColors.primarycolor),
          ),

          centerTitle: true,
          title: const CustomAppbarText(
            text: 'BrandSphere',
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
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData ||
                  snapshot.data == null ||
                  snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const ShimmerFeed();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3.1,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.docs[index];

                      return InkWell(
                        onTap: () {
                          feedScreenProvider.navigator(data, context);
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
                                  border: Border(
                                      bottom: BorderSide(
                                          color: ConstColors.customGrey
                                              .withOpacity(0.4))),
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  image: DecorationImage(
                                      image: NetworkImage(data['image']),
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
                                            icon:
                                                Icons.favorite_border_outlined,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          //store name
                                          titletext:
                                              data['brandname'] ?? 'brand name',
                                          fontsize: smallText,
                                          bold: FontWeight.normal,
                                          textcolor: ConstColors.customGrey),
                                      CustomText(
                                          titletext: data['productname'],
                                          fontsize: normalText,
                                          bold: FontWeight.normal,
                                          textcolor: ConstColors.blackColor),
                                      CustomText(
                                          titletext:
                                              ' \$${data['discountprice']}',
                                          fontsize: Heading3,
                                          bold: FontWeight.bold,
                                          textcolor:
                                              ConstColors.seconderyColor),
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
              );
            }));
  }
}
