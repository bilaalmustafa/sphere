import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/screens/Seller_Screen/Seller_Provider.dart';
import 'package:sphere/UI/screens/auth/logIn_Screen/LognIn_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sellerProvider = Provider.of<SellerProvider>(context, listen: false);
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
              SizedBox(
                height: size.height * 0.03,
              ),
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
                  titletext: 'Select brand logo',
                  fontsize: smallText,
                  bold: FontWeight.normal,
                  textcolor: ConstColors.seconderyColor),
              SizedBox(
                height: size.height * 0.06,
              ),
              CustomTextField(
                  controller: sellerProvider.brandnameContoller,
                  title: 'Brand name'),
              CustomTextField(
                  controller: sellerProvider.descriptionContoller,
                  title: 'Discreption'),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomButton(
                  buttontext: 'Confirm',
                  buttoncolor: ConstColors.seconderyColor,
                  btntextcolor: ConstColors.primarycolor,
                  onTop: () {
                    var brandname =
                        sellerProvider.brandnameContoller.text.trim();
                    var description =
                        sellerProvider.descriptionContoller.text.trim();
                    sellerRole(brandname, description, context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sellerRole(
      String brandname, String description, BuildContext context) async {
    User? userId = FirebaseAuth.instance.currentUser;

    if (brandname.isEmpty || description.isEmpty) {
      flutterToast("Please fill in all fields!");
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId!.uid)
          .update({
        'brand': brandname,
        'description': description,
        'role': 'seller',
        'createAt': DateTime.now(),
      });

      Navigator.pushNamed(context, '/LoginScreen');
      flutterToast('Profile create successful !.');
    } catch (e) {
      print(e);
      flutterToast('Failed to create profile: ${e.toString()}');
    }
  }
}
