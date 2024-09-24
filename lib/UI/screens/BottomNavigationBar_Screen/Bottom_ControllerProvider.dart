import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/AllStore_Screen/AllStore_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Chats_Screens/Chats_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Feeds_Screens/Feeds_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Profile_Screens/StoreProfile_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/User_Profile/UserProfile.dart';

class BottomControllerProvider with ChangeNotifier {
  int _selectItem = 0;
  final List<Widget> _screens = [
    const FeedsScreen(),
    const AllStoreScreen(),
    const ChatScreen(),
    const Center(
      child: CircularProgressIndicator(),
    ),
  ];

  int get selectItem => _selectItem;
  List<Widget> get screens => _screens;

  BottomControllerProvider() {
    fetchUserRole();
  }

  void changeTab(int value) {
    _selectItem = value;
    notifyListeners();
  }

  Future<void> fetchUserRole() async {
    try {
      User? userId = FirebaseAuth.instance.currentUser;
      if (ConnectionState == ConnectionState.waiting) {
        const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (userId != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId.uid)
            .get();

        if (snapshot.exists) {
          if (snapshot['role'] == 'seller') {
            _screens[3] = const StoreProfileScreen();
          } else {
            _screens[3] = const UserProfile();
          }
        }
      }
    } catch (e) {
      print("Error fetching user role: $e");
      _screens[3] = const Center(child: Text("Error loading profile"));
    } finally {
      notifyListeners();
    }
  }
}
