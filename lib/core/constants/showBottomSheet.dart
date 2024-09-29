import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/components/ImagePicker.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Profile_Screens/StoreProfile_Controller.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

import 'Const_Heading.dart';

void showbottomsheet(
    String userid,
    BuildContext context,
    String update,
    String title,
    double disPrice,
    double price,
    int stock,
    String description,
    String image,
    String productid) {
  final storeProfileProvider =
      Provider.of<StoreProfileProvider>(context, listen: false);
  final buyerProvider = Provider.of<BuyerProvider>(context, listen: false);

  Size size = MediaQuery.of(context).size;
  TextEditingController titLecontroller = TextEditingController(text: title);
  TextEditingController discountPricecontroller =
      TextEditingController(text: disPrice.toString());
  TextEditingController priceController =
      TextEditingController(text: price.toString());
  TextEditingController stockController =
      TextEditingController(text: stock.toString());
  TextEditingController descriptController =
      TextEditingController(text: description);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      print('showwwww');
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: ConstColors.primarycolor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
            ),
            width: double.infinity,
            //height: size.height * 0.9,
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 5,
                    width: 50,
                    color: ConstColors.seconderyColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(onTap: () {
                    imagePicker('products', context);
                  }, child:
                      Consumer<BuyerProvider>(builder: (context, vm, child) {
                    return CircleAvatar(
                      radius: size.height * 0.07,
                      backgroundColor: ConstColors.thirdColor,
                      backgroundImage: vm.imageFile != null
                          ? FileImage(vm.imageFile!)
                          : (update == 'update' && vm.imageFile == null
                              ? NetworkImage(image)
                              : null) as ImageProvider<Object>?,
                      child: vm.imageFile == null && update == 'add'
                          ? Icon(
                              Icons.camera_alt_outlined,
                              size: 50,
                              color: ConstColors.primarycolor,
                            )
                          : null,
                    );
                  })),
                ),
                CustomTextField(
                    obscure: false,
                    length: 16,
                    title: 'Title',
                    controller: titLecontroller),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: CustomTextField(
                          obscure: false,
                          title: 'Discount price',
                          controller: discountPricecontroller),
                    ),
                    Container(
                      width: 120,
                      child: CustomTextField(
                          obscure: false,
                          title: 'Price',
                          controller: priceController),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      child: CustomTextField(
                          obscure: false,
                          title: 'Availible stock',
                          controller: stockController),
                    ),
                  ],
                ),
                TextFormField(
                  controller: descriptController,
                  maxLines: 6,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(300),
                  ],
                  decoration: InputDecoration(
                      fillColor: ConstColors.thirdColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ConstColors.thirdColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      // contentPadding:
                      //     EdgeInsets.only(top: 100, right: 8, left: 8),
                      label: CustomText(
                          titletext: 'Discreption',
                          fontsize: smallText,
                          bold: FontWeight.normal,
                          textcolor: ConstColors.seconderyColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CustomButton(
                      buttontext: update != 'update' ? 'Add' : 'Update',
                      buttoncolor: ConstColors.seconderyColor,
                      btntextcolor: ConstColors.primarycolor,
                      onTop: () {
                        int? intstock =
                            int.tryParse(stockController.text.trim());
                        double? doubledisprice = double.tryParse(
                            discountPricecontroller.text.trim());
                        double? doubleprice =
                            double.tryParse(priceController.text.trim());

                        if (update != 'update') {
                          storeProfileProvider.addproducts(
                              userid,
                              titLecontroller.text.trim(),
                              doubledisprice!,
                              doubleprice!,
                              intstock!,
                              descriptController.text.trim(),
                              context,
                              buyerProvider.imageFile!);
                          print('update fuction');
                        } else {
                          storeProfileProvider.updateProduct(
                              context,
                              titLecontroller.text.trim(),
                              doubledisprice!,
                              doubleprice!,
                              intstock!,
                              descriptController.text.trim(),
                              buyerProvider.imageFile!,
                              productid);
                          print('add fuction');
                        }
                        ;
                      }),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
