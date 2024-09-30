import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class BuyerProvider extends ChangeNotifier {
  String _imageURL = '';
  File? _imageFile;
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  TextEditingController get phonenoController => _phonenoController;

  TextEditingController get addressController => _addressController;
  File? get imageFile => _imageFile;

  String get imageURL => _imageURL;

  set imageURL(url) {
    _imageURL = url;
    notifyListeners();
  }

  set imageFile(url) {
    _imageFile = url;
    notifyListeners();
  }

  Future<void> buyerRole(String userid, String phoneNo, String address,
      BuildContext context, File imageFile) async {
    if (userid == null) {
      flutterToast("User is not logged in!");
      return;
    }

    if (phoneNo.isEmpty || address.isEmpty) {
      flutterToast("Please fill in all fields!");
      return;
    }
    if (imageFile!.path.isEmpty) {
      flutterToast("Please select image");
      return;
    }

    try {
      String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference refroot =
          FirebaseStorage.instance.ref().child('image').child(uniqueName);
      await refroot.putFile(File(imageFile.path));
      String downloadurl = await refroot.getDownloadURL();
      _imageURL = downloadurl;

      if (_imageURL.isEmpty) {
        flutterToast('Image upload failed. Please try again.');
        return;
      }
      await FirebaseFirestore.instance.collection('users').doc(userid).update({
        'image': _imageURL,
        'address': address,
        'phoneno': phoneNo,
        'role': 'buyer',
        'createAt': DateTime.now(),
      });
      _imageFile = null;
      Navigator.pushNamed(context, '/LoginScreen');

      flutterToast('Profile create successfully.');
    } catch (e) {
      flutterToast('Failed to create profile: ${e.toString()}');
    }
    notifyListeners();
  }
}
