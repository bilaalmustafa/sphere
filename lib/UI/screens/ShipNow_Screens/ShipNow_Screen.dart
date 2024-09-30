import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/models/OrderItemModel.dart';

class ShipnowScren extends StatelessWidget {
  const ShipnowScren(
      {super.key,
      required this.date,
      required this.name,
      required this.address,
      required this.total,
      required this.orderId,
      required this.phoneno,
      required this.itemlist});
  final String date, name, address, phoneno;
  final double total;
  final int orderId;
  final List<dynamic> itemlist;

  @override
  Widget build(BuildContext context) {
    int orderid = int.parse(orderId.toString());
    List<OrderItems> cartItems =
        itemlist.map((item) => OrderItems.fromMap(item)).toList();

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
                      titletext: '# $orderid',
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
                      titletext: date.toString(),
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
                    textcolor: ConstColors.blackColor),
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
                      titletext: name,
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
                      titletext: phoneno,
                      fontsize: smallText,
                      bold: FontWeight.w500,
                      textcolor: ConstColors.blackColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomText(
                        titletext: 'Address:',
                        fontsize: smallText,
                        bold: FontWeight.bold,
                        textcolor: ConstColors.blackColor),
                  ),
                  Flexible(
                    flex: 4,
                    child: CustomText(
                        titletext: address,
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
                  textcolor: ConstColors.blackColor),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    var datalist = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: ConstColors.primarycolor,
                            backgroundImage: NetworkImage(datalist.image),
                          ),
                          title: CustomText(
                              titletext: datalist.itemname,
                              fontsize: smallText,
                              bold: FontWeight.w500,
                              textcolor: ConstColors.seconderyColor),
                          subtitle: CustomText(
                              titletext: 'Size: ${datalist.Sizes}',
                              fontsize: smallText,
                              bold: FontWeight.w500,
                              textcolor: ConstColors.seconderyColor),
                          trailing: Column(
                            children: [
                              CustomText(
                                  titletext: '\$ ${datalist.price}',
                                  fontsize: smallText,
                                  bold: FontWeight.w500,
                                  textcolor: ConstColors.blackColor),
                              CustomText(
                                  titletext: 'Qty ${datalist.qty}',
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
                      titletext: '\$ ${total.toStringAsFixed(2)}',
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
                  CustomText(
                      titletext: '\$ ${total + 200}',
                      fontsize: smallText,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
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
            buttontext: 'Ship now',
            buttoncolor: ConstColors.seconderyColor,
            btntextcolor: ConstColors.primarycolor,
            onTop: () async {
              // try {
              //   List<Map<String, dynamic>> itemlist = cartProvider.cart
              //       .map((item) => item.toJson())
              //       .toList();

              //   await FirebaseFirestore.instance
              //       .collection('orders')
              //       .doc()
              //       .set({
              //     'userid': cartProvider.cart[0].brandId,
              //     'image': data['image'],
              //     'username': data['userName'],
              //     'phoneno': data['phoneno'],
              //     'address': data['address'],
              //     'date': Datetime,
              //     'total': cartProvider.totalPrice + 200,
              //     'orderId': checkoutProvider.ordetId,
              //     'itemlist': itemlist
              //   });
              // } catch (e) {
              //   flutterToast('failed: $e');
              // }
            }),
      ),
    );
  }
}
