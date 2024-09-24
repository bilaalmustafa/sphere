import 'package:flutter/material.dart';
import 'package:sphere/UI/screens/Products_DetialScreen/ProductDetailScreen.dart';

class FeedScreenProvider with ChangeNotifier {
  void navigator(final data, BuildContext context) {
    String userId = data['userid'] ?? '';
    String image = data['image'] ?? ''; // Default to an empty string if null
    String storename =
        data['brandname'] ?? 'Unknown Brand'; // Provide a default brand name
    double price = data['price'] ?? 0.0; // Default price
    double disprice = data['discountprice'] ?? 0.0; // Default discount price
    int stock = data['stock'] ?? 0; // Default stock
    String productname =
        data['productname'] ?? 'Unknown Product'; // Default product name
    String description = data['discreption'] ??
        'No description available'; // Default description
    print('navigatorrr');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDerailScreen(
        brandId: userId,
        image: image,
        storename: storename,
        price: price,
        productname: productname,
        discountprice: disprice,
        description: description,
        stock: stock,
      );
    }));

    notifyListeners();
  }
}
