import 'package:flutter/material.dart';

class CustonRatingWidget extends StatelessWidget {
  const CustonRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      // color: Colors.green,
      child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (contex, index) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
              size: 14,
            );
          }),
    );
  }
}
