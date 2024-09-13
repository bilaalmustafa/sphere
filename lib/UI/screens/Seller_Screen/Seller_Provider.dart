import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class SellerProvider with ChangeNotifier {
  final TextEditingController _brandnameContoller = TextEditingController();
  final TextEditingController _descriptionContoller = TextEditingController();

  TextEditingController get brandnameContoller => _brandnameContoller;
  TextEditingController get descriptionContoller => _descriptionContoller;

  Future<void> sellerRole(String brandname, String description,
      BuildContext context, File imageFile) async {
    User? userId = FirebaseAuth.instance.currentUser;
    final buyerProvider = Provider.of<BuyerProvider>(context, listen: false);

    if (brandname.isEmpty || description.isEmpty) {
      flutterToast("Please fill in all fields!");
      return;
    }

    try {
      String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference refroot =
          FirebaseStorage.instance.ref().child('image').child(uniqueName);
      await refroot.putFile(File(imageFile.path));
      String downloadurl = await refroot.getDownloadURL();
      buyerProvider.imageURL = downloadurl;

      if (buyerProvider.imageURL.isEmpty) {
        flutterToast('Image upload failed. Please try again.');
        return;
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId!.uid)
          .update({
        'image': buyerProvider.imageURL,
        'brand': brandname,
        'description': description,
        'role': 'seller',
        'createAt': DateTime.now(),
      });

      Navigator.pushNamed(context, '/LoginScreen');

      flutterToast('Profile create successful');
    } catch (e) {
      print(e);
      flutterToast('Failed to create profile: ${e.toString()}');
    }
    notifyListeners();
  }
}
