import 'package:flutter/material.dart';

class BuyerProvider extends ChangeNotifier {
  String _imageURL = '';
  TextEditingController _phonenoController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  TextEditingController get phonenoController => _phonenoController;

  TextEditingController get addressController => _addressController;

  String get imageURL => _imageURL;

  set imageURL(url) {
    _imageURL = url;
    notifyListeners();
  }
}
