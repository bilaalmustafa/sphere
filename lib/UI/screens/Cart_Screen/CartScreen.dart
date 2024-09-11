import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/UI/screens/CheckOut_Screen/CheckOutScreen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 18,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: ConstColors.primarycolor),
        ),
        leading: const CustomLeadingBack(),
        elevation: 0,
      ),
      backgroundColor: ConstColors.primarycolor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.amber,
              width: double.infinity,
              child: Image(
                image: AssetImage(ImagesAssets.mycart),
                fit: BoxFit.contain,
                height: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                  titletext: storeName,
                  fontsize: Heading3,
                  bold: FontWeight.bold,
                  textcolor: ConstColors.seconderyColor),
            ),
            Consumer<CartProvider>(
              builder: (context, vm, child) => Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemCount: vm.cart.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(
                              color: ConstColors.thirdColor.withOpacity(0.5),
                              border: Border.all(
                                  color:
                                      ConstColors.customGrey.withOpacity(0.2)),
                            ),
                            // color: Colors.amber,
                            child: Row(
                              children: [
                                Container(
                                  width: 120,
                                  // color: Colors.black,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ConstColors.customGrey
                                              .withOpacity(0.2)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              vm.cart[index]['image']),
                                          fit: BoxFit.cover)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            titletext: vm.cart[index]['store'],
                                            fontsize: normalText,
                                            bold: FontWeight.w500,
                                            textcolor: ConstColors.customGrey),
                                        CustomText(
                                            titletext:
                                                '\$ ${vm.cart[index]['discountprice'].toString()}',
                                            fontsize: Heading3,
                                            bold: FontWeight.w600,
                                            textcolor:
                                                ConstColors.seconderyColor),
                                        Row(
                                          children: [
                                            CustomText(
                                                titletext: 'Size :',
                                                fontsize: smallText,
                                                bold: FontWeight.w500,
                                                textcolor:
                                                    ConstColors.customGrey),
                                            CustomText(
                                                titletext: vm.cart[index]
                                                        ['size']
                                                    .toString(),
                                                fontsize: normalText,
                                                bold: FontWeight.w500,
                                                textcolor:
                                                    ConstColors.seconderyColor),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                                titletext: 'Qty :',
                                                fontsize: smallText,
                                                bold: FontWeight.w500,
                                                textcolor:
                                                    ConstColors.customGrey),
                                            CustomText(
                                                titletext: vm.cart[index]['Qty']
                                                    .toString(),
                                                fontsize: normalText,
                                                bold: FontWeight.w500,
                                                textcolor:
                                                    ConstColors.seconderyColor),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  // color: Colors.black
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ConstColors.customGrey
                                            .withOpacity(0.2)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.add,
                                          color: ConstColors.CustomRed,
                                        ),
                                      ),
                                      CustomText(
                                          titletext: vm.cart[index][vm.quantity]
                                              .toString(),
                                          fontsize: smallText,
                                          bold: FontWeight.w600,
                                          textcolor: ConstColors.blackColor),
                                      Icon(
                                        Icons.delete,
                                        color: ConstColors.CustomRed,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: ConstColors.primarycolor,
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      titletext: 'Total Price',
                      fontsize: Heading2,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.seconderyColor),
                  CustomText(
                      titletext: '\$ 900.00',
                      fontsize: Heading2,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.seconderyColor)
                ],
              ),
              CustomButton(
                  buttontext: 'Checkout',
                  buttoncolor: ConstColors.seconderyColor,
                  btntextcolor: ConstColors.primarycolor,
                  onTop: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                      context,
                    ) {
                      return const CheckOutScreen();
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
