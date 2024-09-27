import 'package:flutter/material.dart';

class CustonRatingWidget extends StatelessWidget {
  const CustonRatingWidget({
    super.key,
    required this.rating,
  });
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          size: 12,
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
        );
      }),
    );
  }
}
