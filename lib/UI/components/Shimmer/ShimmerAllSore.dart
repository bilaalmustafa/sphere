import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class ShimmerAllStore extends StatelessWidget {
  const ShimmerAllStore({super.key, required this.size, required this.Length});

  final Size size;
  final int Length;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/StoresScreen');
        },
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 2.9,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: ConstColors.basecolor,
                highlightColor: ConstColors.highlightcolor,
                child: Container(
                  color: Colors.amber,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.black,
                        highlightColor: Colors.green,
                        child: CircleAvatar(
                          radius: size.width * 0.13,
                          backgroundColor: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
