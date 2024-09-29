// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sphere/UI/components/Custom_TextField.dart';
// import 'package:sphere/core/constants/Const_Colors.dart';

// class CustomSliverSearchBar extends StatelessWidget {
//   const CustomSliverSearchBar({
//     super.key,
//     required this.controller,
//   });
//   final TextEditingController controller;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return SliverAppBar(
//         elevation: 10,
//         shadowColor: ConstColors.blackColor,
//         automaticallyImplyLeading: false,
//         toolbarHeight: size.height * 0.05,
//         pinned: true,
//         scrolledUnderElevation: 10,
//         backgroundColor: ConstColors.primarycolor,
//         flexibleSpace: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: CustomTextField(
//             controller: controller,
//             title: 'Search',
//             icon: CupertinoIcons.search,
//           ),
//         ));
//   }
// }
