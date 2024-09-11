import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sphere/UI/components/CustomSliverSearchBar.dart';
import 'package:sphere/UI/components/Custom_SliverGrid.dart';
import 'package:sphere/UI/components/Custom_SliverStack.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Stores_Screens/Stores_Provider.dart';

import 'package:sphere/core/constants/Const_Colors.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen(
      {super.key, required this.brandname, required this.description});
  final String brandname, description;

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ConstColors.thirdColor,
        body: CustomScrollView(
          slivers: [
            CustomSliverStack(
              size: size,
              condition: 'StoresScreen',
              brandname: brandname,
              description: description,
            ),
            CustomSliverSearchBar(controller: storeProvider.searchController),

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
