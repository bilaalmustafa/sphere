import 'package:flutter/material.dart';

class ProductDetialProvider with ChangeNotifier {
  int _selected = 1;

  int get selected => _selected;

  change(value) {
    _selected = value;
    notifyListeners();
  }
}
