import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class CheckOutProvider with ChangeNotifier {
  int _orderId = 1;

  int get ordetId => _orderId;

  void increamentId() {
    _orderId++;
    notifyListeners();
  }

  Future<void> CheckOut(data, BuildContext context, String datetime) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    try {
      List<Map<String, dynamic>> itemlist =
          cartProvider.cart.map((item) => item.toJson()).toList();

      await FirebaseFirestore.instance.collection('orders').doc().set({
        'userid': cartProvider.cart[0].brandId,
        'image': data['image'],
        'username': data['userName'],
        'phoneno': data['phoneno'],
        'address': data['address'],
        'date': datetime,
        'total': cartProvider.totalPrice,
        'orderId': ordetId,
        'itemlist': itemlist
      }).then((value) {
        cartProvider.cart.clear();
        Navigator.pushReplacementNamed(context, '/NavigationBottomScreen');
      });
    } catch (e) {
      flutterToast('failed: $e');
    }
  }
}
