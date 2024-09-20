import 'package:flutter/material.dart';

class ProductDetialProvider with ChangeNotifier {
  int _selected = 1;

  int get selected => _selected;

  change(value) {
    _selected = value;
    notifyListeners();
  }

  String addSize() {
    switch (_selected) {
      case 1:
        return 'S';

      case 2:
        return 'M';

      case 3:
        return 'L';

      case 4:
        return 'XL';
      default:
        return '';
    }
  }
}
