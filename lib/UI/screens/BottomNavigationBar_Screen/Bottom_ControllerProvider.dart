import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/AllStore_Screen/AllStore_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Chats_Screens/Wishlist_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Feeds_Screens/Feeds_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Profile_Screens/StoreProfile_Screen.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/User_Profile/UserProfile.dart';

class BottomControllerProvider with ChangeNotifier {
  int _selectItem = 0;
  final List<Widget> _screens = [
    const FeedsScreen(),
    const AllStoreScreen(),
    const Wishlist(),
    const Center(
      child: CircularProgressIndicator(),
    ),
  ];

  int get selectItem => _selectItem;
  List<Widget> get screens => _screens;

  String? _userEmail;
  String? get userEmail => _userEmail;

  set userEmail(value) {
    _userEmail = value;
  }

  late SharedPreferences sep;

  void setEmail(String useremail) async {
    sep = await SharedPreferences.getInstance();
    sep.setString('userEmail', useremail);
    notifyListeners();
    print('echecckkk $useremail');
  }

  void _getEmail() async {
    notifyListeners();
  }

  // Future<void> logoutUser() async {
  //   await sep.remove('userEmail');
  // }

  BottomControllerProvider() {
    fetchUserRole();
    // _getEmail();
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

// class BottomControllerProvider with ChangeNotifier {
//   int _selectItem = 0;
//   final List<Widget> _screens = [
//     const FeedsScreen(),
//     const AllStoreScreen(),
//     const Wishlist(),
//     const Center(
//       child: CircularProgressIndicator(),
//     ),
//   ];

//   int get selectItem => _selectItem;
//   List<Widget> get screens => _screens;

//   String? _userEmail;
//   String? get userEmail => _userEmail;

//   set userEmail(String? value) {
//     _userEmail = value;
//     notifyListeners();
//   }

//   late SharedPreferences sep;

//   // Asynchronous initialization of SharedPreferences
//   Future<void> initSharedPreferences() async {
//     sep = await SharedPreferences.getInstance();
//     _userEmail = sep.getString('userEmail');
//     notifyListeners();
//   }

//   void setEmail(String useremail) async {
//     sep = await SharedPreferences.getInstance();
//     sep.setString('userEmail', useremail);
//     _userEmail = useremail; // Set email in provider
//     notifyListeners();
//     print('Set email: $useremail');
//   }

//   void _getEmail() async {
//     sep = await SharedPreferences.getInstance();
//     _userEmail = sep.getString('userEmail');
//     notifyListeners();
//   }

//   // Future to handle logout properly
//   Future<void> logoutUser() async {
//     sep = await SharedPreferences.getInstance();
//     await sep.remove('userEmail');
//     _userEmail = null;
//     notifyListeners();
//   }

//   BottomControllerProvider() {
//     initSharedPreferences(); // Initialize SharedPreferences
//     fetchUserRole(); // Fetch role from Firebase
//   }

//   void changeTab(int value) {
//     _selectItem = value;
//     notifyListeners();
//   }

//   // Method to fetch the user role and update screens dynamically
//   Future<void> fetchUserRole() async {
//     try {
//       User? userId = FirebaseAuth.instance.currentUser;

//       if (userId != null) {
//         DocumentSnapshot snapshot = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userId.uid)
//             .get();

//         if (snapshot.exists) {
//           String userRole = snapshot['role'] ?? 'buyer'; // Default to 'buyer'
//           if (userRole == 'seller') {
//             _screens[3] = const StoreProfileScreen();
//           } else {
//             _screens[3] = const UserProfile();
//           }
//         }
//       } else {
//         _screens[3] = const Center(child: Text("No user found"));
//       }
//     } catch (e) {
//       print("Error fetching user role: $e");
//       _screens[3] = const Center(child: Text("Error loading profile"));
//     } finally {
//       notifyListeners(); // Notify listeners to refresh UI after the role is fetched
//     }
//   }
// }
