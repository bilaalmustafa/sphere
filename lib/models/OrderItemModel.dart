class OrderItems {
  final String brandId; //brand user id
  final String image; //product image
  final String itemname; // product name
  final double price; // per product price
  final int qty;
  final String Sizes;

  OrderItems(
      {required this.Sizes,
      required this.brandId,
      required this.image,
      required this.itemname,
      required this.price,
      required this.qty});

  factory OrderItems.fromMap(Map<String, dynamic> map) {
    return OrderItems(
        Sizes: map['size'],
        brandId: map['brandId'],
        image: map['image'],
        itemname: map['itemname'],
        price: map['price'],
        qty: map['qty']);
  }
}
