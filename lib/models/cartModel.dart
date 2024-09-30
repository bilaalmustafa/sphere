class Cart {
  String brandId;
  String image;
  String shopname;
  String itemname;
  double price;
  String size;
  int qty;

  Cart(
      {required this.brandId,
      required this.image,
      required this.shopname,
      required this.itemname,
      required this.price,
      required this.size,
      required this.qty});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        brandId: json['brandId'],
        image: json['image'] as String,
        shopname: json['shopname'] as String,
        itemname: json['itemname'] as String,
        price: (json['price'] as num).toDouble(),
        size: json['size'] as String,
        qty: json['qty'] as int,
      );

  Map<String, dynamic> toJson() => {
        'brandId': brandId,
        'image': image,
        'shopname': shopname,
        'itemname': itemname,
        'price': price,
        'size': size,
        'qty': qty
      };
}
