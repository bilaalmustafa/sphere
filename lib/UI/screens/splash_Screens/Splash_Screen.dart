import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sphere/UI/screens/CreateAccount_Screen/CreateAccount.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    login();
  }

  Future<void> login() async {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const CreateAccount();
        }));
        // Properly handle null checks for userEmail
        // if (bottomProvider.userEmail == null) {
        //   // Navigate to the login/create account screen
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) {
        //     return const CreateAccount();
        //   }));
        // } else {
        //   // Navigate to the bottom navigation screen (user is logged in)
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) {
        //     return const NevigationBottomScreen();
        //   }));
        // }
      },
    );
  }
  // Future<void> checkLoginStatus() async {
  //   final bottomProvider =
  //       Provider.of<BottomControllerProvider>(context, listen: false);

  //   SharedPreferences sep = await SharedPreferences.getInstance();
  //   String? email = sep.getString('userEmail');

  //   // If email is null or empty, assign null to userEmail, otherwise assign the email
  //   bottomProvider.userEmail = email?.isNotEmpty == true ? email : null;

  //   // Debugging log
  //   print("Stored email: $email");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.seconderyColor,
      body: Center(
        child: Image(image: AssetImage(ImagesAssets.logo)),
      ),
    );
  }
}
