import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class SignUpControllerPrivoder with ChangeNotifier {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  Future<void> signup(String username, String useremail, String userpassword,
      String confirmpassword, BuildContext context) async {
    if (useremail.isEmpty || userpassword.isEmpty) {
      return flutterToast("Please fill in all fields!");
    }

    if (userpassword.length < 6) {
      return flutterToast('Password must be at least 6 characters long');
    }
    if (userpassword.toString() != confirmpassword.toString()) {
      return flutterToast('Your password does not match');
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
          'role': 'buyer',
          'rating': 0,
          'rators': 0,
          'createAt': DateTime.now(),
        });

        // Navigate to Buyer/Seller Screen
        Navigator.pushNamed(context, '/BuyerSeller');
        flutterToast('Sign up is Successful!');

        // Clear the text fields
        _userNameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
      }
    } catch (e) {
      flutterToast('Failed to sign up: ${e.toString()}');
    }
  }
}
