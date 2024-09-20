import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/generated/assets.dart';

class ShimmerSliverStack extends StatelessWidget {
  const ShimmerSliverStack({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.09,
        ),
        child: Stack(
          children: [
            //first

            Shimmer.fromColors(
              baseColor: ConstColors.basecolor,
              highlightColor: ConstColors.highlightcolor,
              child: Container(
                //alignment: Alignment.topRight,
                height: size.height * 0.3,
                width: size.width * 0.8,
                color: ConstColors.seconderyColor,
              ),
            ),
            //second
            Positioned(
              right: size.width * 0.02,
              top: size.height * 0.035,
              child: Shimmer.fromColors(
                baseColor: ConstColors.basecolor,
                highlightColor: ConstColors.highlightcolor,
                child: Container(
                  height: size.height * 0.2,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    color: ConstColors.primarycolor,
                    image: DecorationImage(
                        image: AssetImage(ImagesAssets.forthImage),
                        fit: BoxFit.fill),
                    border:
                        Border.all(color: ConstColors.primarycolor, width: 5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
