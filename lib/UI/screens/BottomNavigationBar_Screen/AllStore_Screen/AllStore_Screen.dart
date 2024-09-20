import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/components/CostomCarousalSlider.dart';
import 'package:sphere/UI/components/CustomAppbarText.dart';
import 'package:sphere/UI/components/Custom_RatingWidget.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Shimmer/ShimmerAllSore.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/AllStore_Screen/AllStore_Provider.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Stores_Screens/Stores_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class AllStoreScreen extends StatefulWidget {
  const AllStoreScreen({super.key});

  @override
  State<AllStoreScreen> createState() => _AllStoreScreenState();
}

class _AllStoreScreenState extends State<AllStoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final allStoreProvider =
        Provider.of<AllSToreProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomAppbarText(
          text: 'Brands',
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: ConstColors.primarycolor),
        ),
        // backgroundColor: ConstColors.primarycolor,
        actions: const [
          CustomCurt(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: ConstColors.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        titletext: 'Sell offers',
                        fontsize: Heading2,
                        bold: FontWeight.w500,
                        textcolor: ConstColors.seconderyColor),
                    Icon(
                      Icons.arrow_drop_down,
                      color: ConstColors.seconderyColor,
                    )
                  ],
                ),
              ),
              Consumer<AllSToreProvider>(
                builder: (context, vm, child) =>
                    CostomCarousalSlider(imageList: vm.imageList),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        titletext: 'All Store',
                        fontsize: Heading2,
                        bold: FontWeight.w500,
                        textcolor: ConstColors.seconderyColor),
                    Icon(
                      Icons.arrow_drop_down,
                      color: ConstColors.seconderyColor,
                    )
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('role', isEqualTo: 'seller')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.hasError ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return ShimmerAllStore(size: size, Length: 10);
                    }

                    final docs = snapshot.data!.docs;
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2 / 2.9,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          final doc = snapshot.data!.docs[index];

                          return InkWell(
                            onTap: () {
                              allStoreProvider.onChange(index);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return StoresScreen(
                                  uId: doc['userId'],
                                  brandname: doc['brand'],
                                  description: doc['description'],
                                  image: doc['image'],
                                );
                              }));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              color: allStoreProvider.seleted == index
                                  ? ConstColors.seconderyColor.withOpacity(0.1)
                                  : ConstColors.primarycolor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          size.width * 0.13,
                                        ),
                                        border: Border.all(
                                            color: ConstColors.seconderyColor
                                                .withOpacity(0.2))),
                                    child: CircleAvatar(
                                      backgroundColor: ConstColors.primarycolor,
                                      radius: size.width * 0.13,
                                      backgroundImage:
                                          NetworkImage(doc['image']),
                                    ),
                                  ),
                                  const CustonRatingWidget(),
                                  CustomText(
                                      titletext: doc['brand'],
                                      fontsize: smallText,
                                      bold: FontWeight.w500,
                                      textcolor: ConstColors.seconderyColor
                                          .withOpacity(0.5))
                                ],
                              ),
                            ),
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
