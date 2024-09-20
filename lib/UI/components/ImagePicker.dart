import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

Future<void> imagePicker(String collec, BuildContext context) async {
  final buyerProvider = Provider.of<BuyerProvider>(context, listen: false);

  print('kegeee');
  ImagePicker imagepicker = ImagePicker();
  XFile? file = await imagepicker.pickImage(source: ImageSource.gallery);
  if (file != null) {
    buyerProvider.imageFile = File(file.path);
  } else {
    flutterToast('No image selected');
  }
}
