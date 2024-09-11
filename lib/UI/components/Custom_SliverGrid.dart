import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_CartButton.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_WishList.dart';
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
  });
  final String condition;
  VoidCallback? onTap;

  final Size size;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return SliverGrid.builder(
        itemCount: dememodel.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.5,
          // mainAxisSpacing: 10 //,
          //crossAxisSpacing: 10
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductDerailScreen(
                    image: dememodel[index]['image'] ??
                        '', // Default to empty string if null
                    storename: dememodel[index]['store'] ?? 'Unknown Store',
                    price: (dememodel[index]['price'] ??
                        0.0), // Default to 0.0 if null and convert to String
                    productname:
                        dememodel[index]['productname'] ?? 'Unknown Product',
                    discountprice: (dememodel[index]['discountprice'] ??
                        0.0), // Default to 0.0 if null and convert to String
                    description:
                        dememodel[index]['description'] ?? 'No Description',
                    stock: dememodel[index]['stock'] ??
                        'Out of Stock', // Default value if null
                  );
                }));
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
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                              image: DecorationImage(
                                  image: AssetImage(dememodel[index]['image']),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            titletext: dememodel[index]
                                                ['productname'],
                                            fontsize: normalText,
                                            bold: FontWeight.w600,
                                            textcolor:
                                                ConstColors.seconderyColor),
                                        condition == 'StoreProfileScreen'
                                            ? InkWell(
                                                onTap: onTap,
                                                child: Icon(
                                                  Icons.edit,
                                                  color: ConstColors
                                                      .seconderyColor,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            titletext:
                                                '\$${dememodel[index]['discountprice']}',
                                            fontsize: normalText,
                                            bold: FontWeight.normal,
                                            textcolor:
                                                ConstColors.seconderyColor),
                                        condition == 'StoreProfileScreen'
                                            ? Icon(
                                                Icons.delete,
                                                color:
                                                    ConstColors.seconderyColor,
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              condition == 'StoreProfileScreen'
                                  ? Container()
                                  : CustomCartButton(
                                      size: size,
                                      onTap: () {
                                        cartProvider.addtoCart(index);
                                      },
                                    ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
