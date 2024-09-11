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
      child: CircularProgressIndicator(), // Temporary loading screen
    ),
  ];

  int get selectItem => _selectItem;
  List<Widget> get screens => _screens;

  BottomControllerProvider() {
    fetchUserRole(); // Fetch user role when the provider is initialized
  }

  void changeTab(int value) {
    _selectItem = value;
    notifyListeners();
  }

  Future<void> fetchUserRole() async {
    try {
      User? userId = FirebaseAuth.instance.currentUser;

      if (userId != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId.uid)
            .get();

        if (snapshot.exists) {
          if (snapshot['role'] == 'buyer') {
            _screens[3] = const UserProfile(); // Show UserProfile for buyers
          } else {
            _screens[3] =
                const StoreProfileScreen(); // Show StoreProfile for sellers
          }
        }
      }
    } catch (e) {
      print("Error fetching user role: $e");
      _screens[3] = const Center(child: Text("Error loading profile"));
    } finally {
      notifyListeners(); // Notify listeners after updating the screens
    }
  }
}
