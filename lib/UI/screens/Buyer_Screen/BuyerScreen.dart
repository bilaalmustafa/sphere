import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/components/ImagePicker.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class BuyerScreen extends StatefulWidget {
  const BuyerScreen({super.key});

  @override
  State<BuyerScreen> createState() => _BuyerScreenState();
}

class _BuyerScreenState extends State<BuyerScreen> {
  @override
  Widget build(BuildContext context) {
    User? userId = FirebaseAuth.instance.currentUser;
    final buyerProvider = Provider.of<BuyerProvider>(context, listen: false);
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
              Consumer<BuyerProvider>(builder: (context, vm, child) {
                return CircleAvatar(
                  backgroundImage:
                      vm.imageFile == null ? null : FileImage(vm.imageFile!),
                  backgroundColor: ConstColors.thirdColor,
                  radius: 60,
                  child: vm.imageFile == null
                      ? Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: ConstColors.primarycolor,
                        )
                      : null,
                );
              }),
              InkWell(
                onTap: () {
                  imagePicker('users', context);
                  ;
                },
                child: CustomText(
                  titletext: 'Select Profile',
                  fontsize: smallText,
                  bold: FontWeight.normal,
                  textcolor: ConstColors.seconderyColor,
                ),
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
                onTop: () async {
                  var phoneNo = buyerProvider.phonenoController.text.trim();
                  var address = buyerProvider.addressController.text.trim();

                  await buyerProvider.buyerRole(userId!.uid, phoneNo, address,
                      context, buyerProvider.imageFile!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
