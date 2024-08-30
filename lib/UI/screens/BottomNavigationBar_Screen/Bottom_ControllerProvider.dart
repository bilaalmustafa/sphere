import 'package:flutter/material.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Chats_Screens/Chats_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Feeds_Screens/Feeds_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Profile_Screens/StoreProfile_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Stores_Screens/Stores_Screen.dart';

class BottomControllerProvider with ChangeNotifier {
  int _selectItem = 0;
  final List<Widget> _screens = [
    const FeedsScreen(),
    const StoresScreen(),
    const ChatScreen(),
    const StoreProfileScreen(),
  ];

  int get selectItem => _selectItem;
  List<Widget> get screen => _screens;

  changeTab(value) {
    _selectItem = value;
    notifyListeners();
  }
}
