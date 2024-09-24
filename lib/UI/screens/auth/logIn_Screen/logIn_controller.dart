import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Bottom_ControllerProvider.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class LogInControllerPrivoder with ChangeNotifier {
  TextEditingController _loginemailController = TextEditingController();
  TextEditingController _loginpasswordController = TextEditingController();

  TextEditingController get loginemailController => _loginemailController;
  TextEditingController get loginpasswordController => _loginpasswordController;

  Future<void> signIn(String email, String password, context) async {
    final buttomNavigationBar =
        Provider.of<BottomControllerProvider>(context, listen: false);
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
        // buttomNavigationBar.fetchUserRole();
        flutterToast('Log in successful');
        Navigator.pushReplacementNamed(context, '/NavigationBottomScreen');
      });
    } catch (e) {
      print(e);
      flutterToast('Failed to Log in:');
    }
    notifyListeners();
  }
}
