import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphere/models/cartModel.dart';

class WishlistProvider with ChangeNotifier {
  String? _currentUseremail;
  late SharedPreferences prefs;

  List<Cart> _list = [];
  List get list => _list;

  bool isInWishlist(var objItem) {
    bool isInWishlist = _list.any((item) =>
        item.brandId == objItem.brandId && item.itemname == objItem.itemname);
    return isInWishlist;
  }

  Future setUserId(String email) async {
    _currentUseremail = email;
    _loadCartFromPreferences();
  }

  WishlistProvider() {
    _loadCartFromPreferences();
  }
  Future<void> _loadCartFromPreferences() async {
    print('getinggg');
    prefs = await SharedPreferences.getInstance();
    List<String>? cartJson = prefs.getStringList('wishlist$_currentUseremail');
    if (cartJson != null) {
      _list = cartJson.map((item) => Cart.fromJson(json.decode(item))).toList();
      print('savinggg ${cartJson}');
    }
    notifyListeners();
  }

  Future<void> _saveCartToPreferences() async {
    print('savinggg');
    prefs = await SharedPreferences.getInstance();
    List<String> cartJson =
        _list.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('wishlist$_currentUseremail', cartJson);
    print('savinggg ${cartJson}');
    notifyListeners();
  }

  void addToCart(Cart item) {
    print('addinggg');
    _list.add(item);
    _saveCartToPreferences();

    notifyListeners();
  }

  void removeFromCart(Cart item) {
    _list.removeWhere((cartItem) =>
        cartItem.brandId == item.brandId && cartItem.itemname == item.itemname);
    _saveCartToPreferences();
    notifyListeners();
  }
}
