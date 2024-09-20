import 'package:flutter/foundation.dart';

class Cart {
  String shopname;
  String itemname;
  double price;
  String size;
  int qty;

  Cart(
      {required this.shopname,
      required this.itemname,
      required this.price,
      required this.size,
      required this.qty});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        shopname: json['shopname'] as String,
        itemname: json['itemname'] as String,
        price: (json['price'] as num).toDouble(),
        size: json['size'] as String,
        qty: json['qty'] as int,
      );

  Map<String, dynamic> toJson() => {
        'shopname': shopname,
        'itemname': itemname,
        'price': price,
        'size': size,
        'qty': qty
      };
}
