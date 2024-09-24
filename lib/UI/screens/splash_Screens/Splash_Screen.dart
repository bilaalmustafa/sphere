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

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const CreateAccount();
        }));
      },
    );
  }

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
