import 'package:flutter/material.dart';
import 'package:sphere/generated/assets.dart';

class AllSToreProvider with ChangeNotifier {
  List<String> _imageList = [
    ImagesAssets.firstImage,
    ImagesAssets.thirdImage,
    ImagesAssets.scondImage
  ];

  int _selected = 0;

  List<String> get imageList => _imageList;
  int get seleted => _selected;

  onChange(index) {
    _selected = index;
    notifyListeners();
  }
}
