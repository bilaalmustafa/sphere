import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Stores_Screens/Stores_Screen.dart';
import 'package:sphere/UI/screens/Products_DetialScreen/ProductDetailScreen.dart';
import 'package:sphere/models/cartModel.dart';

class FeedScreenProvider with ChangeNotifier {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  TextEditingController get searchController => _searchController;

  onChange(value) {
    _searchQuery = value.toLowerCase();
    notifyListeners();
  }

  void navigator(final data, BuildContext context) {
    String userId = data['userid'] ?? '';
    String image = data['image'] ?? '';
    String storename = data['brandname'] ?? 'Unknown Brand';
    double price = data['price'] ?? 0.0;
    double disprice = data['discountprice'] ?? 0.0;
    int stock = data['stock'] ?? 0;
    String productname = data['productname'] ?? 'Unknown Product';
    String description = data['discreption'] ?? 'No description available';
    print('navigatorrr');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDerailScreen(
        brandId: userId,
        image: image,
        storename: storename,
        price: price,
        productname: productname,
        discountprice: disprice,
        description: description,
        stock: stock,
      );
    }));

    notifyListeners();
  }

  visitStore(BuildContext context, String userid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userid).get();
    Navigator.push(context, MaterialPageRoute(builder: (Context) {
      return StoresScreen(
        brandname: snapshot['brand'],
        description: snapshot['description'],
        uId: userid,
        image: snapshot['image'],
        rating: snapshot['rating'],
      );
    }));
  }
}
