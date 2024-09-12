import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_CartButton.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_WishList.dart';
import 'package:sphere/UI/components/Shimmer/SlivergrideShimmer.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Feeds_Screens/Feeds_Controller.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/UI/screens/Products_DetialScreen/ProductDetailScreen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/generated/assets.dart';
import 'package:sphere/models/demeModel.dart';

class CustomSliverGrid extends StatelessWidget {
  CustomSliverGrid({
    super.key,
    required this.size,
    required this.condition,
    this.onTap,
    this.uId,
  });
  final String condition;
  VoidCallback? onTap;
  String? uId;

  final Size size;

  @override
  Widget build(BuildContext context) {
    print('build');
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final feedScreenProvider =
        Provider.of<FeedScreenProvider>(context, listen: false);
    User? userId = FirebaseAuth.instance.currentUser;
    String check() {
      if (condition == 'StoresScreen') {
        return uId!;
      } else {
        return userId!.uid;
      }
    }

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('userid', isEqualTo: check())
            .snapshots(),
        builder: (context, snapshot) {
          print('checkkk ${check().toString()}');
          print('uiddd ${uId.toString()}');

          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.hasError ||
              snapshot.data!.docs.isEmpty ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const SliverGrideShimmer();
          }
          final docs = snapshot.data!.docs;

          return SliverGrid.builder(
              itemCount: docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.5,
              ),
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      feedScreenProvider.navigator(data, context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ConstColors.primarycolor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              blurStyle: BlurStyle.normal,
                              color: ConstColors.customGrey,
                              offset: const Offset(0, 0)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                                //height: 155,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    //  color: Colors.orange,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: ConstColors.customGrey
                                                .withOpacity(0.4))),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16)),
                                    image: DecorationImage(
                                        image: NetworkImage(data['image']),
                                        fit: BoxFit.fill)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: condition == 'StoreProfileScreen'
                                            ? PopupMenuButton(
                                                onSelected: (item) {},
                                                itemBuilder: (context) {
                                                  return [
                                                    PopupMenuItem(
                                                        value: 1,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Icon(
                                                              Icons.edit,
                                                              color: ConstColors
                                                                  .seconderyColor,
                                                            ),
                                                            CustomText(
                                                                titletext:
                                                                    'Edit',
                                                                fontsize:
                                                                    normalText,
                                                                bold: FontWeight
                                                                    .w500,
                                                                textcolor:
                                                                    ConstColors
                                                                        .blackColor)
                                                          ],
                                                        )),
                                                    PopupMenuItem(
                                                        value: 1,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .delete_forever_outlined,
                                                              color: ConstColors
                                                                  .CustomRed,
                                                            ),
                                                            CustomText(
                                                                titletext:
                                                                    'Delete',
                                                                fontsize:
                                                                    normalText,
                                                                bold: FontWeight
                                                                    .w500,
                                                                textcolor:
                                                                    ConstColors
                                                                        .blackColor)
                                                          ],
                                                        ))
                                                  ];
                                                },
                                                child: CustomWishList(
                                                  bgColor: ConstColors
                                                      .primarycolor
                                                      .withOpacity(.5),
                                                  icon:
                                                      Icons.more_vert_outlined,
                                                  color: ConstColors
                                                      .seconderyColor,
                                                ),
                                              )
                                            : CustomWishList(
                                                bgColor: ConstColors
                                                    .primarycolor
                                                    .withOpacity(.5),
                                                icon: Icons
                                                    .favorite_border_outlined,
                                                color:
                                                    ConstColors.seconderyColor,
                                              )),
                                  ],
                                )),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ConstColors.primarycolor,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          //product name
                                          titletext:
                                              data['productname'].toString(),
                                          fontsize: normalText,
                                          bold: FontWeight.w600,
                                          textcolor:
                                              ConstColors.seconderyColor),
                                      CustomText(
                                          // product price
                                          titletext:
                                              '\$ ${data['discountprice'].toString()}',
                                          fontsize: normalText,
                                          bold: FontWeight.normal,
                                          textcolor:
                                              ConstColors.seconderyColor),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
