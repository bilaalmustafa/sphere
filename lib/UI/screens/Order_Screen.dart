import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sphere/UI/components/CustomAppbarText.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/screens/ShipNow_Screens/ShipNow_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? userId = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: ConstColors.primarycolor,
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(color: ConstColors.primarycolor),
          ),
          title: const CustomAppbarText(
            text: 'Orders',
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('orders')
                .where('userid', isEqualTo: userId!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData ||
                  snapshot.data == null ||
                  snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: ConstColors.seconderyColor,
                ));
              }
              return snapshot.data!.docs.isEmpty
                  ? Center(
                      child: CustomText(
                          titletext: 'No order',
                          fontsize: 20,
                          bold: FontWeight.normal,
                          textcolor: ConstColors.seconderyColor),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    ConstColors.seconderyColor.withOpacity(0.2),
                                backgroundImage: NetworkImage(data['image']),
                                child: data['image'] == ''
                                    ? Icon(
                                        Icons.person,
                                        color: ConstColors.primarycolor,
                                      )
                                    : null),
                            title: CustomText(
                                titletext: data['username'],
                                fontsize: normalText,
                                bold: FontWeight.normal,
                                textcolor: ConstColors.seconderyColor),
                            subtitle: CustomText(
                                titletext: data['date'].toString(),
                                fontsize: smallText,
                                bold: FontWeight.normal,
                                textcolor: ConstColors.blackColor),
                            tileColor: ConstColors.thirdColor,
                            trailing: Wrap(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ShipnowScren(
                                        date: data['date'],
                                        name: data['username'],
                                        address: data['address'],
                                        total: data['total'],
                                        orderId: data['orderId'],
                                        phoneno: data['phoneno'],
                                        itemlist: data['itemlist'],
                                      );
                                    }));
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: ConstColors.primarycolor,
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () async {
                                    FirebaseFirestore.instance
                                        .collection('orders')
                                        .doc(data.id)
                                        .delete();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: ConstColors.primarycolor,
                                    radius: 15,
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
            }));
  }
}
