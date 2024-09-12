import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class ShimmerFeed extends StatelessWidget {
  const ShimmerFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 3.1,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: ConstColors.basecolor,
            highlightColor: ConstColors.highlightcolor,
            child: Container(
              decoration: BoxDecoration(
                color: ConstColors.primarycolor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        });
  }
}
