import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sphere/UI/components/Custom_SliverGrid.dart';
import 'package:sphere/UI/components/Custom_SliverStack.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Profile_Screens/StoreProfile_Controller.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/showBottomSheet.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final storeprofileProvider = Provider.of<StoreProfileProvider>(context);
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
            onTap: () {
              showbottomsheet(context);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstColors.primarycolor,
        onPressed: () {
          showbottomsheet(context);
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: ConstColors.seconderyColor,
        ),
      ),
    );
  }
}
