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
    final storeProfileProvider =
        Provider.of<StoreProfileProvider>(context, listen: false);
    String title = storeProfileProvider.titleController.text.trim();
    String disprice = storeProfileProvider.disPriceController.text.trim();
    String price = storeProfileProvider.priceController.text.trim();
    String stock = storeProfileProvider.stuckController.text.trim();
    String description = storeProfileProvider.discriptionController.text.trim();

    double doubledisprice = double.tryParse(disprice) ?? 0.0;
    double doubleprice = double.tryParse(price) ?? 0.0;
    int intstock = int.tryParse(stock) ?? 0;
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
              showbottomsheet(context, 'add', title, doubledisprice,
                  doubleprice, intstock, description, '', '');
              print('showed');
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ConstColors.primarycolor,
        onPressed: () {
          showbottomsheet(context, 'add', title, doubledisprice, doubleprice,
              intstock, description, '', '');
          print('showeddd');
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
