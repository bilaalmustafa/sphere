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

void showbottomsheet(context) {
  final storeProfileProvider =
      Provider.of<StoreProfileProvider>(context, listen: false);
  final buyerProvider = Provider.of<BuyerProvider>(context, listen: false);

  Size size = MediaQuery.of(context).size;

  ;
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Allows the bottom sheet to extend beyond the default height
    builder: (BuildContext context) {
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
                            : null,
                        child: vm.imageFile == null
                            ? Icon(
                                Icons.camera_alt_outlined,
                                size: 50,
                                color: ConstColors.primarycolor,
                              )
                            : null);
                  })),
                ),
                CustomTextField(
                    title: 'Title',
                    controller: storeProfileProvider.titleController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: CustomTextField(
                          title: 'Discount price',
                          controller: storeProfileProvider.disPriceController),
                    ),
                    Container(
                      width: 120,
                      child: CustomTextField(
                          title: 'Price',
                          controller: storeProfileProvider.priceController),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      child: CustomTextField(
                          title: 'Availible stuck',
                          controller: storeProfileProvider.stuckController),
                    ),
                  ],
                ),
                TextFormField(
                  controller: storeProfileProvider.discriptionController,
                  maxLines: 6,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                        200), // Limits the number of characters to 100
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
                      buttontext: 'Add',
                      buttoncolor: ConstColors.seconderyColor,
                      btntextcolor: ConstColors.primarycolor,
                      onTop: () {
                        String productname =
                            storeProfileProvider.titleController.text.trim();
                        var disprice =
                            storeProfileProvider.disPriceController.text.trim();
                        var price =
                            storeProfileProvider.priceController.text.trim();
                        var stock =
                            storeProfileProvider.stuckController.text.trim();
                        var description = storeProfileProvider
                            .discriptionController.text
                            .trim();
                        var intstock = int.tryParse(stock);
                        storeProfileProvider.addproducts(
                            productname,
                            disprice,
                            price,
                            intstock!,
                            description,
                            context,
                            buyerProvider.imageFile!);
                        print('add fuction');
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
