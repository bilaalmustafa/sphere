import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sphere/UI/components/Custom_LeadingBack.dart';
import 'package:sphere/UI/components/Custom_RatingWidget.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/Shimmer/ShimmerSliverStact.dart';
import 'package:sphere/UI/components/custom_Curt.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Flutertoast.dart';
import 'package:sphere/generated/assets.dart';

var globalname = '';

class CustomSliverStack extends StatelessWidget {
  const CustomSliverStack({
    super.key,
    required this.size,
    required this.condition,
    this.shadowclr,
    this.brandname,
    this.description,
    this.image,
  });
  final String condition;
  final Size size;
  final Color? shadowclr;
  final String? brandname, description, image;

  @override
  Widget build(BuildContext context) {
    User? userId = FirebaseAuth.instance.currentUser;
    return SliverAppBar(
        expandedHeight: size.height * 0.323,
        // toolbarHeight: 60,
        //floating: true,
        stretch: true,
        elevation: 10,
        shadowColor: shadowclr,
        scrolledUnderElevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: ConstColors.primarycolor,
        pinned: true,
        leading: condition == 'StoreProfileScreen'
            ? null
            : const CustomLeadingBack(),
        actions: [
          condition == 'StoreProfileScreen'
              ? PopupMenuButton(
                  color: ConstColors.primarycolor,
                  onSelected: (item) {},
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          value: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.edit,
                                color: ConstColors.seconderyColor,
                              ),
                              CustomText(
                                  titletext: 'Edit',
                                  fontsize: normalText,
                                  bold: FontWeight.w500,
                                  textcolor: ConstColors.blackColor)
                            ],
                          ))
                    ];
                  },
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: ConstColors.seconderyColor,
                  ),
                )
              : const CustomCurt(),
          const SizedBox(
            width: 10,
          )
        ],

        // backgroundColor: Colors.amber,
        flexibleSpace: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userId!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              try {
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.data() == null ||
                    snapshot.hasError ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return ShimmerSliverStack(size: size);
                }
              } catch (e) {
                flutterToast(e.toString());
              }
              var data = snapshot.data!.data() as Map<String, dynamic>;
              globalname = data['brand'];

              return FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.09,
                  ),
                  child: Stack(
                    children: [
                      //first

                      Container(
                        //alignment: Alignment.topRight,
                        height: size.height * 0.3,
                        width: size.width * 0.8,
                        color: ConstColors.seconderyColor,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        titletext: condition == 'StoresScreen'
                                            ? brandname
                                            : data['brand'],
                                        fontsize: size.width * .04,
                                        bold: FontWeight.bold,
                                        textcolor: ConstColors.primarycolor),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                        titletext: condition == 'StoresScreen'
                                            ? description
                                            : data['description'],
                                        fontsize: size.width * .025,
                                        bold: FontWeight.normal,
                                        textcolor: ConstColors.primarycolor),
                                    const Spacer(),
                                    const CustonRatingWidget(),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(flex: 3, child: Container())
                          ],
                        ),
                      ),
                      //second
                      Positioned(
                        right: size.width * 0.02,
                        top: size.height * 0.035,
                        child: Container(
                          height: size.height * 0.2,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                            color: ConstColors.primarycolor,
                            image: DecorationImage(
                                image: NetworkImage(condition == 'StoresScreen'
                                    ? image
                                    : data['image']),
                                fit: BoxFit.fill),
                            border: Border.all(
                                color: ConstColors.primarycolor, width: 5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
