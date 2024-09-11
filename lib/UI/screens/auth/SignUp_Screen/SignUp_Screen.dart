import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/screens/auth/SignUp_Screen/Signup_Controller.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/core/constants/Flutertoast.dart';
import 'package:sphere/generated/assets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpControllerProvider =
        Provider.of<SignUpControllerPrivoder>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstColors.primarycolor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ConstColors.seconderyColor,
          ),
        ),
        backgroundColor: ConstColors.primarycolor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage(ImagesAssets.loginLogo),
                width: size.width * 0.6,
              ),
              CustomTextField(
                controller: signUpControllerProvider.userNameController,
                title: username,
              ),
              CustomTextField(
                controller: signUpControllerProvider.emailController,
                title: email,
              ),
              CustomTextField(
                controller: signUpControllerProvider.passwordController,
                title: password,
                icon: Icons.visibility_off_outlined,
              ),
              CustomTextField(
                controller: signUpControllerProvider.confirmPasswordController,
                title: confirmpassword,
                icon: Icons.visibility_off_outlined,
              ),
              SizedBox(height: size.height * 0.05),
              CustomButton(
                buttontext: signUp,
                buttoncolor: ConstColors.seconderyColor,
                btntextcolor: ConstColors.primarycolor,
                onTop: () {
                  var username =
                      signUpControllerProvider.userNameController.text.trim();
                  var useremail =
                      signUpControllerProvider.emailController.text.trim();
                  var userpassword =
                      signUpControllerProvider.passwordController.text.trim();

                  signup(username, useremail, userpassword,
                      signUpControllerProvider, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signup(String username, String useremail, String userpassword,
      signupprovider, BuildContext context) async {
    if (useremail.isEmpty || userpassword.isEmpty) {
      flutterToast("Please fill in all fields!");
      return;
    }

    if (userpassword.length < 6) {
      flutterToast('Password must be at least 6 characters long');
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: useremail, password: userpassword);

      // Correctly get the user ID after creating the account
      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'userName': username,
          'userEmail': useremail,
          'userId': user.uid,
          'image': '',
          'brand': '',
          'address': '',
          'phoneno': '',
          'description': '',
          'role': '',
          'createAt': DateTime.now(),
        });

        // Navigate to Buyer/Seller Screen
        Navigator.pushNamed(context, '/BuyerSeller');
        flutterToast('Sign up is Successful!');

        // Clear the text fields
        signupprovider.userNameController.clear();
        signupprovider.emailController.clear();
        signupprovider.passwordController.clear();
        signupprovider.confirmPasswordController.clear();
      }
    } catch (e) {
      print(e);
      flutterToast('Failed to sign up: ${e.toString()}');
    }
  }
}
