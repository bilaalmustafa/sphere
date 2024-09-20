import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphere/models/cartModel.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _cart = [];
  late SharedPreferences sharedPreferences;

  List<Cart> get cart => _cart;

  CartProvider() {
    _loadCartFromPreferences();
  }

  // Load the cart data from SharedPreferences
  Future<void> _loadCartFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      _cart = cartJson.map((item) => Cart.fromJson(json.decode(item))).toList();
    }
    notifyListeners();
  }
  // Save the cart data to SharedPreferences

  Future<void> _saveCartToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartJson =
        _cart.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cart', cartJson);
  }

  // Add a new item to the cart
  void addToCart(Cart item) {
    _cart.add(item);
    _saveCartToPreferences();
    notifyListeners();
  }

  // Remove an item from the cart
  void removeFromCart(int index) {
    _cart.removeAt(index);
    _saveCartToPreferences();
    notifyListeners();
  }

  // Increment the quantity of a specific cart item
  void incrementQuantity(int index) {
    _cart[index].qty++;
    _saveCartToPreferences();
    notifyListeners();
  }

  // Decrement the quantity of a specific cart item
  void decrementQuantity(int index) {
    if (_cart[index].qty > 1) {
      _cart[index].qty--;
      _saveCartToPreferences();
      notifyListeners();
    }
  }

  // Calculate total price of the cart
  double get totalPrice {
    return _cart.fold(
        0, (total, current) => total + current.price * current.qty);
  }
}
