import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Custom_SliverStack.dart';
import 'package:sphere/UI/components/ImagePicker.dart';
import 'package:sphere/UI/components/Image_upload.dart';
import 'package:sphere/UI/screens/Buyer_Screen/Buyer_Provider.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class StoreProfileProvider with ChangeNotifier {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _disPriceController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _stuckController = TextEditingController();
  TextEditingController _discriptionController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get disPriceController => _disPriceController;
  TextEditingController get priceController => _priceController;
  TextEditingController get stuckController => _stuckController;
  TextEditingController get discriptionController => _discriptionController;

  void addproducts(String productname, String disprice, String price, int stock,
      String description, BuildContext context, File imageFile) async {
    final buyerProvider = Provider.of<BuyerProvider>(context, listen: false);

    User? userId = FirebaseAuth.instance.currentUser;

    if (productname.isEmpty ||
        disprice.isEmpty ||
        price.isEmpty ||
        stock.toString().isEmpty ||
        description.isEmpty) {
      flutterToast('Filled all fields');
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
      await FirebaseFirestore.instance.collection('products').doc().set(
        {
          'image': buyerProvider.imageURL,
          'brandname': globalname,
          'productname': productname,
          'discountprice': disprice,
          'price': price,
          'stock': stock,
          'discreption': description,
          'userid': userId!.uid,
          'createAt': DateTime.now(),
        },
      ).then((value) {
        flutterToast(' data added successful');
        Navigator.pop(context);
        _titleController.clear();
        _disPriceController.clear();
        _priceController.clear();
        _stuckController.clear();
        _discriptionController.clear();
      });
    } catch (e) {
      flutterToast('Fail ${e.toString()}');
    }
  }
}
