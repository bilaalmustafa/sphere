import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/screens/auth/logIn_Screen/logIn_controller.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logInControllerProvider =
        Provider.of<LogInControllerPrivoder>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstColors.primarycolor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/CreateAnAccount');
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
            // mainAxisAlignment: MainAxisAlignment.s,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(ImagesAssets.loginLogo),
                width: size.width * 0.6,
              ),
              CustomTextField(
                controller: logInControllerProvider.loginemailController,
                title: email,
              ),
              CustomTextField(
                controller: logInControllerProvider.loginpasswordController,
                title: password,
                icon: Icons.visibility_off_outlined,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                      titletext: forgetpassword,
                      fontsize: 13,
                      bold: FontWeight.bold,
                      textcolor: ConstColors.seconderyColor)
                ],
              ),
              SizedBox(
                height: size.height * 0.09,
              ),
              CustomButton(
                  buttontext: logIn,
                  buttoncolor: ConstColors.seconderyColor,
                  btntextcolor: ConstColors.primarycolor,
                  onTop: () {
                    var email = logInControllerProvider
                        .loginemailController.text
                        .trim();
                    var password = logInControllerProvider
                        .loginpasswordController.text
                        .trim();
                    logInControllerProvider.signIn(email, password, context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
