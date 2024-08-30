import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sphere/UI/components/Custom_TextField.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class CustomSliverSearchBar extends StatelessWidget {
  const CustomSliverSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        elevation: 10,
        shadowColor: ConstColors.blackColor,
        automaticallyImplyLeading: false,
        //toolbarHeight: 200,
        pinned: true,
        scrolledUnderElevation: 10,
        backgroundColor: ConstColors.primarycolor,
        flexibleSpace: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomTextField(
            title: 'Search',
            icon: CupertinoIcons.search,
          ),
        ));
  }
}
