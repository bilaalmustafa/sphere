import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/Shimmer/Shimmerfeeds.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Bottom_ControllerProvider.dart';
import 'package:sphere/core/constants/Const_Colors.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomProvider =
        Provider.of<BottomControllerProvider>(context, listen: false);
    User? userId = FirebaseAuth.instance.currentUser;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: ConstColors.seconderyColor,
              ),
            );
          }

          return BottomBarInspiredOutside(
            elevation: 8,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                  color: ConstColors.blackColor,
                  offset: const Offset(-5, -5)),
            ],
            curve: Curves.decelerate,
            animated: true,
            indexSelected: bottomProvider.selectItem,
            onTap: (value) {
              bottomProvider.changeTab(value);
            },
            items: [
              const TabItem(
                icon: CupertinoIcons.collections,
                title: 'Home',
              ),
              const TabItem(
                icon: Icons.storefront,
                title: 'Shop',
              ),
              // TabItem(
              //   icon: Icons.favorite,
              //   title: 'wishlist',
              // ),
              const TabItem(
                icon: CupertinoIcons.heart,
                title: 'Wishlist',
              ),
              TabItem(
                  icon: snapshot.data!['role'] == 'seller'
                      ? Icons.storefront
                      : CupertinoIcons.profile_circled,
                  title:
                      snapshot.data!['role'] == 'seller' ? 'Store' : 'Profile')
            ],
            backgroundColor: ConstColors.primarycolor,
            color: ConstColors.seconderyColor,
            colorSelected: ConstColors.primarycolor,
            // borderRadius: BorderRadius.circular(30),
            itemStyle: ItemStyle.circle,
            isAnimated: true,
            chipStyle: ChipStyle(
                notchSmoothness: NotchSmoothness.verySmoothEdge,
                background: ConstColors.seconderyColor),
          );
        });
  }
}
