import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphere/UI/components/Custom_Text.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Bottom_ControllerProvider.dart';
import 'package:sphere/UI/screens/BottomNavigationBar_Screen/Chats_Screens/Wishlist_Controller.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/UI/screens/CheckOut_Screen/Check_out_Provider.dart';
import 'package:sphere/UI/screens/Order_Screen.dart';
import 'package:sphere/UI/screens/auth/logIn_Screen/logIn_controller.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    User? userId = FirebaseAuth.instance.currentUser;
    final loginProvider =
        Provider.of<LogInControllerPrivoder>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final wishlistprovider =
        Provider.of<WishlistProvider>(context, listen: false);
    final buttomNavigationBar =
        Provider.of<BottomControllerProvider>(context, listen: false);

    return Drawer(
        backgroundColor: ConstColors.primarycolor,
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userId!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData ||
                  snapshot.data == null ||
                  snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Drawer(backgroundColor: ConstColors.primarycolor);
              }
              var data = snapshot.data!;
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: DrawerHeader(
                        decoration:
                            BoxDecoration(color: ConstColors.seconderyColor),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(data['image']),
                              backgroundColor: ConstColors.primarycolor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                                titletext: data['userName'],
                                fontsize: normalText,
                                bold: FontWeight.bold,
                                textcolor: ConstColors.primarycolor)
                          ],
                        )),
                  ),
                  data['role'] == 'seller'
                      ? ListTile(
                          leading: Icon(
                            Icons.receipt,
                            color: ConstColors.seconderyColor,
                          ),
                          title: const Text('Orders'),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const OrderScreen();
                            }));
                          })
                      : Container(),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: ConstColors.seconderyColor,
                      ),
                      title: const Text('Logout'),
                      onTap: () async {
                        try {
                          await FirebaseAuth.instance.signOut().then((value) {
                            flutterToast('Sigout Successful');
                            loginProvider.loginemailController.clear();
                            loginProvider.loginpasswordController.clear();
                            cartProvider.cart.clear();
                            wishlistprovider.list.clear();
                            // buttomNavigationBar.logoutUser();
                            return Navigator.pushNamed(context, '/LoginScreen');
                          });
                        } catch (e) {
                          flutterToast('SignOut Failed');
                        }
                      },
                    ),
                  ),
                ],
              );
            }));
  }
}
