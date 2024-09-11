import 'package:flutter/material.dart';

class AllSToreProvider with ChangeNotifier {
  List<String> _imageList = [
    'Assets/Images/image1.jpeg',
    'Assets/Images/image2.jpeg'
  ];

  int _selected = 0;

  List<String> get imageList => _imageList;
  int get seleted => _selected;

  onChange(index) {
    _selected = index;
    notifyListeners();
  }
}
