import 'package:flutter/material.dart';
import 'package:sphere/UI/screens/Products_DetialScreen/ProductDetailScreen.dart';

class FeedScreenProvider with ChangeNotifier {
  void navigator(final data, BuildContext context) {
    var price = double.tryParse(data['price']);
    var disprice = double.tryParse(data['discountprice']);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDerailScreen(
        image: data['image'] ?? '', // Default to empty string if null
        storename: data['brandname'] ?? 'Unknown Store',
        price: price ?? 00.00, // Default to 0.0 if null and convert to String
        productname: data['productname'] ?? 'Unknown Product',
        discountprice:
            disprice ?? 0.0, // Default to 0.0 if null and convert to String
        description: data['discreption'] ?? 'No Description',
        stock: data['stock'] ?? 'Out of Stock', // Default value if null
      );
    }));
  }
}
