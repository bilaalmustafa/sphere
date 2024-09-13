import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

Future<void> imageUpload(File file, BuildContext context) async {
  final buyerProvider = Provider.of<BuyerProvider>(context);
  print('kegeee22');
  if (file! == null) return;

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
