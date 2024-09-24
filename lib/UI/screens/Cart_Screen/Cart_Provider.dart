import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphere/models/cartModel.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _cart = [];

  List<Cart> get cart => _cart;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  late SharedPreferences prefs;

  CartProvider() {
    _loadCartFromPreferences();
  }

  Future<void> _loadCartFromPreferences() async {
    print('getinggg');
    prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      _cart = cartJson.map((item) => Cart.fromJson(json.decode(item))).toList();
      print('savinggg ${cartJson}');
    }
    notifyListeners();
  }

  Future<void> _saveCartToPreferences() async {
    print('savinggg');
    prefs = await SharedPreferences.getInstance();
    List<String> cartJson =
        _cart.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cart', cartJson);
    print('savinggg ${cartJson}');
    notifyListeners();
  }

  void addToCart(Cart item) {
    print('addinggg');
    _cart.add(item);
    _saveCartToPreferences();
    _updateTotalPrice();
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cart.removeAt(index);
    _saveCartToPreferences();
    _updateTotalPrice();
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _cart[index].qty++;
    _saveCartToPreferences();
    _updateTotalPrice();
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cart[index].qty > 1) {
      _cart[index].qty--;
      _saveCartToPreferences();
      _updateTotalPrice();
      notifyListeners();
    }
  }

  void _updateTotalPrice() {
    _totalPrice = _cart.fold(0, (sum, item) => sum + (item.price * item.qty));
    notifyListeners();
  }
}
