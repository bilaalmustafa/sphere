import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/UI/screens/auth/logIn_Screen/LognIn_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class BuyerScreen extends StatelessWidget {
  const BuyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buyerProvider = Provider.of<BuyerProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstColors.primarycolor,
      appBar: AppBar(
        leading: const CustomLeadingBack(),
        backgroundColor: ConstColors.primarycolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              CircleAvatar(
                backgroundColor: ConstColors.thirdColor,
                radius: 60,
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 40,
                  color: ConstColors.primarycolor,
                ),
              ),
              CustomText(
                titletext: 'Select Profile',
                fontsize: smallText,
                bold: FontWeight.normal,
                textcolor: ConstColors.seconderyColor,
              ),
              SizedBox(height: size.height * 0.06),
              CustomTextField(
                controller: buyerProvider.phonenoController,
                title: 'Phone no',
              ),
              CustomTextField(
                controller: buyerProvider.addressController,
                title: 'Delivery address',
              ),
              SizedBox(height: size.height * 0.08),
              CustomButton(
                buttontext: 'Confirm',
                buttoncolor: ConstColors.seconderyColor,
                btntextcolor: ConstColors.primarycolor,
                onTop: () {
                  var phoneNo = buyerProvider.phonenoController.text.trim();
                  var address = buyerProvider.addressController.text.trim();

                  buyerRole(phoneNo, address, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> buyerRole(
      String phoneNo, String address, BuildContext context) async {
    User? userId = FirebaseAuth.instance.currentUser;

    if (userId == null) {
      flutterToast("User is not logged in!");
      return;
    }

    if (phoneNo.isEmpty || address.isEmpty) {
      flutterToast("Please fill in all fields!");
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId.uid)
          .update({
        'address': address,
        'phoneno': phoneNo,
        'role': 'buyer',
        'createAt': DateTime.now(),
      });

      Navigator.pushNamed(context, '/LoginScreen');
      flutterToast('Profile updated successfully.');
    } catch (e) {
      print(e);
      flutterToast('Failed to update profile: ${e.toString()}');
    }
  }
}
