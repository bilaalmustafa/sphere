import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_Button.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/UI/screens/Buyer_SellerScreen/BuyerSellerScreen.dart';
import 'package:sphere/UI/screens/auth/SignUp_Screen/Signup_Controller.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_text.dart';
import 'package:sphere/generated/assets.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpControllerProvider =
        Provider.of<SignUpControllerPrivoder>(context);
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
            // mainAxisAlignment: MainAxisAlignment.s,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(ImagesAssets.loginLogo),
                width: size.width * 0.6,
              ),
              CustomTextField(
                // controller: signUpControllerProvider.userNameController,
                title: username,
              ),
              CustomTextField(
                // controller: signUpControllerProvider.emailController,
                title: email,
              ),
              CustomTextField(
                // controler: signUpControllerProvider.passwordController,
                title: password,
                icon: Icons.visibility_off_outlined,
              ),
              CustomTextField(
                // controller: signUpControllerProvider.confirmPasswordController,
                title: confirmpassword,
                icon: Icons.visibility_off_outlined,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomButton(
                  buttontext: signUp,
                  buttoncolor: ConstColors.seconderyColor,
                  btntextcolor: ConstColors.primarycolor,
                  onTop: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) {
                      return const BuyerSellerScreen();
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
