import 'package:flutter/material.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CostumImageContainer extends StatelessWidget {
  const CostumImageContainer({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.45,
      decoration: BoxDecoration(
          border: Border.all(color: ConstColors.primarycolor, width: 5),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          )),
    );
  }
}
