import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sphere/UI/components/CustomAppbarText.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/components/ImagePicker.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            Icons.more_vert,
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
                    .doc(userId!.uid)
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
                  var userdata = snapshot.data!;
                  return Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor:
                                ConstColors.seconderyColor.withOpacity(0.2),
                            backgroundImage:
                                NetworkImage(userdata['image'] ?? ''),
                          ),
                          Positioned(
                              left: size.width * 0.05,
                              child: InkWell(
                                onTap: () {
                                  imagePicker('users', context);
                                },
                                child: Icon(
                                  Icons.camera_enhance,
                                  color: ConstColors.seconderyColor,
                                ),
                              ))
                        ],
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
