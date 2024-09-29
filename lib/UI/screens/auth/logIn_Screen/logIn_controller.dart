import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Bottom_ControllerProvider.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Chats_Screens/Wishlist_Controller.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class LogInControllerPrivoder with ChangeNotifier {
  TextEditingController _loginemailController = TextEditingController();
  TextEditingController _loginpasswordController = TextEditingController();

  bool _isobsecure = true;
  bool get isobsecure => _isobsecure;

  void onTap() {
    _isobsecure = !_isobsecure;
    notifyListeners();
  }

  TextEditingController get loginemailController => _loginemailController;
  TextEditingController get loginpasswordController => _loginpasswordController;

  Future<void> signIn(String email, String password, context) async {
    final buttomNavigationBar =
        Provider.of<BottomControllerProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);

    if (email.isEmpty || password.isEmpty) {
      return flutterToast('Please fill in all fields');
    }

    if (password.length < 6) {
      return flutterToast('Password must be at least 6 characters long');
    }
    if (ConnectionState == ConnectionState.none) {
      return flutterToast('Disconnection');
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await buttomNavigationBar.fetchUserRole();
        cartProvider.setUserId(email);
        wishlistProvider.setUserId(email);
        buttomNavigationBar.setEmail(email);

        flutterToast('Log in successful');
        Navigator.pushReplacementNamed(context, '/NavigationBottomScreen');
      });
    } catch (e) {
      print(e);
      flutterToast('Disconnection');
    }
    notifyListeners();
  }
}
