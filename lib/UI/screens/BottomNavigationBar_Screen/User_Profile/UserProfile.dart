import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sphere/UI/components/CustomAppbarText.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Flutertoast.dart';
import 'package:sphere/generated/assets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    User? userId = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: ConstColors.primarycolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const CustomAppbarText(
          text: 'Profile',
        ),
        actions: [
          Icon(
            Icons.favorite,
            color: ConstColors.seconderyColor,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: ConstColors.primarycolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userId!.uid) // Assuming the document ID is the UID
                    .snapshots(),
                builder: (context, snapshot) {
                  try {
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.data!.data() == null ||
                        snapshot.hasError ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: ConstColors.seconderyColor,
                      ));
                    }
                  } catch (e) {
                    flutterToast(e.toString());
                  }
                  var userdata = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,

                        // backgroundImage: AssetImage(userdata['image']),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                          titletext: userdata['userName'],
                          fontsize: normalText,
                          bold: FontWeight.bold,
                          textcolor: ConstColors.seconderyColor),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomText(
                            titletext: userdata['userEmail'],
                            fontsize: smallText,
                            bold: FontWeight.normal,
                            textcolor: ConstColors.customGrey),
                      ),
                      Divider(
                        color: ConstColors.customGrey.withOpacity(0.2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                titletext: 'Contat no',
                                fontsize: normalText,
                                bold: FontWeight.w500,
                                textcolor: ConstColors.blackColor),
                            CustomText(
                                titletext: userdata['phoneno'],
                                fontsize: smallText,
                                bold: FontWeight.normal,
                                textcolor: ConstColors.customGrey),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              titletext: 'Address',
                              fontsize: normalText,
                              bold: FontWeight.w500,
                              textcolor: ConstColors.blackColor),
                          CustomText(
                              titletext: userdata['address'],
                              fontsize: smallText,
                              bold: FontWeight.normal,
                              textcolor: ConstColors.customGrey),
                        ],
                      )
                    ],
                  );
                })),
      ),
    );
  }
}
