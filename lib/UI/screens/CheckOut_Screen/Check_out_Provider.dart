import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphere/UI/screens/Cart_Screen/Cart_Provider.dart';
import 'package:sphere/UI/screens/Congrate_Screen.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Flutertoast.dart';

class CheckOutProvider with ChangeNotifier {
  int _orderId = 1;

  int get ordetId => _orderId;
  int _currentRating = 3;

  int get currentRating => _currentRating;

  int _totalrating = 0;
  int _rators = 0;
  int get totalrating => _totalrating;
  int get rators => _rators;

  Future<void> getOrderID(String userid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('order').doc(userid).get();
    _orderId = snapshot['orderId'];
  }

  Future<void> getrating(String userid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userid).get();
    _rators = snapshot['rators'];
    _totalrating = snapshot['rating'];
    notifyListeners();
  }

  void addrating() {
    _rators++;
    _totalrating = (_currentRating + _totalrating) ~/ rators;

    notifyListeners();
  }

  void increamentId() {
    _orderId++;
    notifyListeners();
  }

  void setCurrentRating(int value) {
    _currentRating = value;
    notifyListeners();
    print('rats$_totalrating');
    print('rats$rators');
  }

  Future<void> CheckOut(data, BuildContext context, String datetime) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    try {
      List<Map<String, dynamic>> itemlist =
          cartProvider.cart.map((item) => item.toJson()).toList();
      if (ConnectionState == ConnectionState.none) {
        return flutterToast('Disconnection');
      }

      await FirebaseFirestore.instance.collection('orders').doc().set({
        'userid': cartProvider.cart[0].brandId,
        'image': data['image'],
        'username': data['userName'],
        'phoneno': data['phoneno'],
        'address': data['address'],
        'date': datetime,
        'total': cartProvider.totalPrice,
        'orderId': ordetId,
        'itemlist': itemlist
      }).then((value) async {
        await getrating(cartProvider.cart[0].brandId);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const CongrateScreen();
        }));

        showDialogBox(context, cartProvider.cart[0].brandId);
        cartProvider.cart.clear();
        cartProvider.saveCartToPreferences();
      });
    } catch (e) {
      flutterToast('failed: $e');
    }
    notifyListeners();
  }

  Future<void> showDialogBox(BuildContext context, String userid) {
    return showDialog(
      context: context,
      builder: (context) {
        return Consumer<CheckOutProvider>(builder: (context, vm, child) {
          return AlertDialog(
            title: Text(
              'Rate this Store',
              style: TextStyle(color: ConstColors.seconderyColor),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Select a rating:'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < vm.currentRating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        vm.setCurrentRating(index + 1);
                      },
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Text('Rating: ${vm.currentRating} stars'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: ConstColors.seconderyColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: ConstColors.seconderyColor),
                ),
                onPressed: () async {
                  addrating();
                  print('rat$_totalrating');
                  print(' tor$_rators');
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userid)
                      .update({'rating': _totalrating, 'rators': _rators});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }
}
