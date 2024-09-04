import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Profile_Screens/StoreProfile_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class StoreProfileProvider with ChangeNotifier {
  void showbottomsheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to extend beyond the default height
      builder: (BuildContext context) {
        return Wrap(
          // Ensures the height does not exceed the content
          children: [
            Container(
              decoration: BoxDecoration(
                color: ConstColors.primarycolor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),

              width: double.infinity,
              height: MediaQuery.of(context).size.height *
                  0.8, // Customize the height (50% of the screen height)
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    color: ConstColors.seconderyColor,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: ConstColors.thirdColor,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 50,
                      color: ConstColors.primarycolor,
                    ),
                  ),
                  const CustomtextFormField(
                    text: 'Title',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 150,
                          child: const CustomtextFormField(
                            text: 'Discount Price',
                          )),
                      Container(
                          width: 120,
                          child: const CustomtextFormField(
                            text: 'Price',
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: 150,
                          child: const CustomtextFormField(
                            text: 'Available stucks',
                          )),
                    ],
                  ),
                  TextFormField(
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        // contentPadding:
                        //     EdgeInsets.only(top: 100, right: 8, left: 8),
                        label: CustomText(
                            titletext: 'Discreption',
                            fontsize: smallText,
                            bold: FontWeight.normal,
                            textcolor: ConstColors.customGrey)),
                  ),
                  CustomButton(
                      buttontext: 'Add',
                      buttoncolor: ConstColors.seconderyColor,
                      btntextcolor: ConstColors.primarycolor,
                      onTop: () {})
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
