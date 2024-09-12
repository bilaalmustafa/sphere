import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

Future<void> imagePicker(String collec, BuildContext context) async {
  final buyerProvider = Provider.of<BuyerProvider>(context, listen: false);
  User? userId = FirebaseAuth.instance.currentUser;

  print('kegeee');
  ImagePicker imagepicker = ImagePicker();
  XFile? file = await imagepicker.pickImage(source: ImageSource.gallery);

  if (file! == null) return;

  print('kegeee22');
  String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference refroot =
      FirebaseStorage.instance.ref().child('image').child(uniqueName);
  try {
    await refroot.putFile(File(file!.path));
    String downloadurl = await refroot.getDownloadURL();
    buyerProvider.imageURL = downloadurl;
  } catch (e) {
    flutterToast('Failed:${e.toString()}');
  }
}
