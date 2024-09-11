import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Profile_Screens/StoreProfile_Controller.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

import 'Const_Heading.dart';

void showbottomsheet(context) {
  final storeProfileProvider =
      Provider.of<StoreProfileProvider>(context, listen: false);
  Size size = MediaQuery.of(context).size;
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
                  child: CircleAvatar(
                    radius: size.height * 0.07,
                    backgroundColor: ConstColors.thirdColor,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 50,
                      color: ConstColors.primarycolor,
                    ),
                  ),
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
                          controller:
                              storeProfileProvider.discriptionController),
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
                        100), // Limits the number of characters to 100
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
                      onTop: () {}),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
  void addproducts() {}
}
