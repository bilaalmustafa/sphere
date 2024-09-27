import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/UI/screens/CheckOut_Screen/Check_out_Provider.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    User? userId = FirebaseAuth.instance.currentUser;
    final checkoutProvider =
        Provider.of<CheckOutProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    String Datetime = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.hasError ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: ConstColors.seconderyColor));
          }
          var data = snapshot.data!;
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
                            titletext:
                                '# ${checkoutProvider.ordetId.toString()}',
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
                            titletext: Datetime.toString(),
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
                          titletext: 'Deliver details',
                          fontsize: smallText,
                          bold: FontWeight.w500,
                          textcolor: ConstColors.seconderyColor),
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
                            titletext: data['userName'],
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
                            titletext: data['phoneno'].toString(),
                            fontsize: smallText,
                            bold: FontWeight.w500,
                            textcolor: ConstColors.blackColor),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomText(
                              titletext: 'Address:',
                              fontsize: smallText,
                              bold: FontWeight.bold,
                              textcolor: ConstColors.blackColor),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomText(
                              titletext: data['address'],
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
                        textcolor: ConstColors.seconderyColor),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartProvider.cart.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: ConstColors.primarycolor,
                                  backgroundImage: NetworkImage(
                                      cartProvider.cart[index].image),
                                ),
                                title: CustomText(
                                    titletext:
                                        cartProvider.cart[index].itemname,
                                    fontsize: smallText,
                                    bold: FontWeight.w500,
                                    textcolor: ConstColors.seconderyColor),
                                trailing: Column(
                                  children: [
                                    CustomText(
                                        titletext:
                                            '\$ ${cartProvider.cart[index].price}',
                                        fontsize: smallText,
                                        bold: FontWeight.w500,
                                        textcolor: ConstColors.blackColor),
                                    CustomText(
                                        titletext:
                                            'Qty ${cartProvider.cart[index].qty}',
                                        fontsize: smallText,
                                        bold: FontWeight.w500,
                                        textcolor: ConstColors.blackColor),
                                  ],
                                )),
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
                            titletext: '\$ ${cartProvider.totalPrice}',
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
                        Consumer<CartProvider>(builder: (context, vm, child) {
                          return CustomText(
                              titletext: '\$ ${vm.totalPrice + 200}',
                              fontsize: smallText,
                              bold: FontWeight.bold,
                              textcolor: ConstColors.blackColor);
                        })
                      ],
                    ),
                  ],
                ),
                //

                //
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  buttontext: 'Check now',
                  buttoncolor: ConstColors.seconderyColor,
                  btntextcolor: ConstColors.primarycolor,
                  onTop: () async {
                    checkoutProvider.CheckOut(data, context, Datetime);
                    checkoutProvider.increamentId();
                    checkoutProvider.showDialogBox(
                        context, cartProvider.cart[0].brandId);
                    checkoutProvider.getrating(cartProvider.cart[0].brandId);
                  }),
            ),
          );
        });
  }
}
