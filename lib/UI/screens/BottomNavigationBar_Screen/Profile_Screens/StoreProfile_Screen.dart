import 'package:flutter/material.dart';

import 'package:sphere/UI/components/Custom_SliverGrid.dart';
import 'package:sphere/UI/components/Custom_SliverStack.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstColors.thirdColor,
      body: CustomScrollView(
        slivers: [
          CustomSliverStack(
            size: size,
            condition: 'StoreProfileScreen',
            shadowclr: ConstColors.blackColor,
          ),
          CustomSliverGrid(
            size: size,
            condition: 'StoreProfileScreen',
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstColors.primarycolor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
          color: ConstColors.seconderyColor,
        ),
      ),
    );
  }
}
