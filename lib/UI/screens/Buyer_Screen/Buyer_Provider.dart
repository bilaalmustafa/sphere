import 'package:flutter/material.dart';

class BuyerProvider with ChangeNotifier {
  TextEditingController _phonenoController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  TextEditingController get phonenoController => _phonenoController;

  TextEditingController get addressController => _addressController;
}
