import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/CustomAppbarText.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_RatingWidget.dart';
import 'package:sphere/UI/components/Custom_SizeContainers.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/UI/screens/Products_DetialScreen/ProductDetial_Provider.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/models/demeModel.dart';

class ProductDerailScreen extends StatelessWidget {
  const ProductDerailScreen(
      {super.key,
      required this.storename,
      required this.price,
      required this.productname,
      required this.discountprice,
      required this.description,
      required this.stock,
      required this.image});

  final String storename;
  final double discountprice, price;
  final String productname, description;
  final int stock;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: ConstColors.primarycolor,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: ConstColors.primarycolor),
        ),
        title: const CustomAppbarText(
          text: 'Detials',
        ),
        //toolbarHeight: 28,
        elevation: 0,
        leading: const CustomLeadingBack(),
        actions: const [
          CustomCurt(),
          SizedBox(
            width: 12,
          )
        ],
        // backgroundColor: ConstColors.seconderyColor,
        // bottom: PreferredSize(preferredSize: preferredSize, child: child),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        titletext: storename,
                        fontsize: normalText,
                        bold: FontWeight.w500,
                        textcolor: ConstColors.customGrey),
                    const CustonRatingWidget(),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomText(
                      titletext: productname,
                      fontsize: Heading2,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.blackColor),
                ],
              ),
              Row(
                children: [
                  CustomText(
                      titletext: discountprice.toString(),
                      fontsize: Heading1,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.seconderyColor),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    titletext: price.toString(),
                    fontsize: Heading3,
                    bold: FontWeight.normal,
                    textcolor: ConstColors.customGrey,
                    lineThrough: TextDecoration.lineThrough,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Consumer<ProductDetialProvider>(
                  builder: (context, vm, child) {
                    return Row(
                      children: [
                        CustomText(
                            titletext: 'Size : ',
                            fontsize: normalText,
                            bold: FontWeight.w500,
                            textcolor: ConstColors.blackColor),
                        CustomSizingContainer(
                          onTop: () {
                            vm.change(1);
                          },
                          size: size,
                          color: vm.selected == 1
                              ? ConstColors.seconderyColor
                              : ConstColors.primarycolor,
                          text: 'S',
                          txtcolor: vm.selected == 1
                              ? ConstColors.primarycolor
                              : ConstColors.seconderyColor,
                        ),
                        CustomSizingContainer(
                          onTop: () {
                            vm.change(2);
                          },
                          size: size,
                          color: vm.selected == 2
                              ? ConstColors.seconderyColor
                              : ConstColors.primarycolor,
                          text: 'M',
                          txtcolor: vm.selected == 2
                              ? ConstColors.primarycolor
                              : ConstColors.seconderyColor,
                        ),
                        CustomSizingContainer(
                          onTop: () {
                            vm.change(3);
                          },
                          size: size,
                          color: vm.selected == 3
                              ? ConstColors.seconderyColor
                              : ConstColors.primarycolor,
                          text: 'L',
                          txtcolor: vm.selected == 3
                              ? ConstColors.primarycolor
                              : ConstColors.seconderyColor,
                        ),
                        CustomSizingContainer(
                          onTop: () {
                            vm.change(4);
                          },
                          size: size,
                          color: vm.selected == 4
                              ? ConstColors.seconderyColor
                              : ConstColors.primarycolor,
                          text: 'XL',
                          txtcolor: vm.selected == 4
                              ? ConstColors.primarycolor
                              : ConstColors.seconderyColor,
                        ),
                        const Spacer(),
                        Container(
                          height: 20,
                          width: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color:
                                  ConstColors.seconderyColor.withOpacity(0.1),
                              border:
                                  Border.all(color: ConstColors.seconderyColor),
                              borderRadius: BorderRadius.circular(20)),
                          child: CustomText(
                              titletext: 'in Stock',
                              fontsize: smallText,
                              bold: FontWeight.w500,
                              textcolor: ConstColors.seconderyColor),
                        )
                      ],
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: CustomText(
                        titletext: 'Description',
                        fontsize: Heading2,
                        bold: FontWeight.bold,
                        textcolor: ConstColors.seconderyColor),
                  ),
                  Divider(
                    color: ConstColors.customGrey.withOpacity(0.2),
                    thickness: 2,
                  ),
                  Container(
                    child: CustomText(
                        titletext: description,
                        fontsize: smallText,
                        bold: FontWeight.normal,
                        textcolor: ConstColors.blackColor),
                  ),
                ],
              ),
              // Spacer(),

              SizedBox(
                height: size.height * 0.1,
              ),
              CustomButton(
                  buttontext: 'Add to Cart',
                  buttoncolor: ConstColors.seconderyColor,
                  btntextcolor: ConstColors.primarycolor,
                  onTop: () {
                    cartProvider.proDetailAdCart(
                        image, storename, discountprice, price);
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
