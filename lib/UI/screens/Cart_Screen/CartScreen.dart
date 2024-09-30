import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/UI/screens/CheckOut_Screen/CheckOutScreen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Flutertoast.dart';
import 'package:sphere/generated/assets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

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
          child: Consumer<CartProvider>(
        builder: (context, vm, child) => Column(
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
                  titletext: vm.cart.isEmpty ? '' : vm.cart[0].shopname,
                  fontsize: Heading3,
                  bold: FontWeight.bold,
                  textcolor: ConstColors.seconderyColor),
            ),
            Expanded(
              child: vm.cart.isEmpty
                  ? Image(image: AssetImage(ImagesAssets.empty))
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      itemCount: vm.cart.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                color: ConstColors.thirdColor.withOpacity(0.5),
                                border: Border.all(
                                    color: ConstColors.customGrey
                                        .withOpacity(0.2)),
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
                                            image: NetworkImage(
                                                vm.cart[index].image),
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
                                              titletext:
                                                  vm.cart[index].itemname,
                                              fontsize: normalText,
                                              bold: FontWeight.w500,
                                              textcolor:
                                                  ConstColors.customGrey),
                                          CustomText(
                                              titletext:
                                                  '\$ ${vm.cart[index].price.toString()}',
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
                                                  titletext: vm.cart[index].size
                                                      .toString(),
                                                  fontsize: normalText,
                                                  bold: FontWeight.w500,
                                                  textcolor: ConstColors
                                                      .seconderyColor),
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
                                                  titletext: vm.cart[index].qty
                                                      .toString(),
                                                  fontsize: normalText,
                                                  bold: FontWeight.w500,
                                                  textcolor: ConstColors
                                                      .seconderyColor),
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
                                          onTap: () {
                                            vm.incrementQuantity(index);
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.green,
                                          ),
                                        ),
                                        CustomText(
                                            titletext:
                                                vm.cart[index].qty.toString(),
                                            fontsize: smallText,
                                            bold: FontWeight.w600,
                                            textcolor: ConstColors.blackColor),
                                        InkWell(
                                          onTap: () {
                                            vm.cart[index].qty >= 2
                                                ? vm.decrementQuantity(index)
                                                : vm.removeFromCart(index);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: ConstColors.CustomRed,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
            )
          ],
        ),
      )),
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
                  Consumer<CartProvider>(builder: (context, vm, child) {
                    return CustomText(
                        titletext: '\$ ${vm.totalPrice.toStringAsFixed(2)}',
                        fontsize: Heading2,
                        bold: FontWeight.bold,
                        textcolor: ConstColors.seconderyColor);
                  })
                ],
              ),
              CustomButton(
                  buttontext: 'Check out',
                  buttoncolor: ConstColors.seconderyColor,
                  btntextcolor: ConstColors.primarycolor,
                  onTop: () {
                    cartProvider.cart.isEmpty
                        ? flutterToast('Cart is empty')
                        : Navigator.push(context, MaterialPageRoute(builder: (
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
