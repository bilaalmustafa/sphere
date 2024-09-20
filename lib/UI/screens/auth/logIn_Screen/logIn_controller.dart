import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class LogInControllerPrivoder with ChangeNotifier {
  TextEditingController _loginemailController = TextEditingController();
  TextEditingController _loginpasswordController = TextEditingController();

  TextEditingController get loginemailController => _loginemailController;
  TextEditingController get loginpasswordController => _loginpasswordController;

  Future<void> signIn(String email, String password, context) async {
    if (email.isEmpty || password.isEmpty) {
      flutterToast('Please fill in all fields');
    }

    if (password.length < 6) {
      flutterToast('Password must be at least 6 characters long');
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        flutterToast('Log in successful !');
        Navigator.pushNamed(context, '/NavigationBottomScreen');
      });
    } catch (e) {
      print(e);
      flutterToast('Failed to Log up:');
    }
    notifyListeners();
  }
}
