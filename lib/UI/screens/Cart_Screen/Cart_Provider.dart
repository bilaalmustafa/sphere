import 'package:flutter/material.dart';
import 'package:sphere/models/demeModel.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cart = [];
  int _quantity = 1;
  List<Map<String, dynamic>> get cart => _cart;
  int get quantity => _quantity;

  addtoCart(index) {
    _cart.add(
      {
        'image': dememodel[index]['image'],
        'store': dememodel[index]['store'],
        'price': dememodel[index]['price'],
        'discountprice': dememodel[index]['discountprice'],
        'size': 'M',
        'Qty': 1,
      },
    );
    notifyListeners();
  }

  proDetailAdCart(image, storename, discountprice, price) {
    _cart.add(
      {
        'image': image,
        'store': storename,
        'discountprice': discountprice,
        'price': price,
        'size': 'M',
        'Qty': 1,
      },
    );
    notifyListeners();
  }

  increment() {
    notifyListeners();
  }
}
