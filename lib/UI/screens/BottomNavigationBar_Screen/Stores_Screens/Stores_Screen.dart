import 'package:flutter/material.dart';

import 'package:sphere/UI/components/CustomSliverSearchBar.dart';
import 'package:sphere/UI/components/Custom_SliverGrid.dart';
import 'package:sphere/UI/components/Custom_SliverStack.dart';

import 'package:sphere/core/constants/Const_Colors.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ConstColors.thirdColor,
        body: CustomScrollView(
          slivers: [
            CustomSliverStack(
              size: size,
              condition: 'StoresScreen',
            ),
            const CustomSliverSearchBar(),

            CustomSliverGrid(
              size: size,
              condition: 'StoresScreen',
            )
            // SliverToBoxAdapter(
            //   child: GridView.builder(
            //     itemCount: 10,
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

            //           crossAxisCount: 2,
            //           childAspectRatio: 2 / 3,
            //           mainAxisSpacing: 10,
            //           crossAxisSpacing: 10),
            //       itemBuilder: (context, index) {
            //         return Container(
            //           color: Colors.orange,
            //         );
            //       }),
            // )
          ],
        ));
  }
}
