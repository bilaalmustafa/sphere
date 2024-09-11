import 'package:fluttertoast/fluttertoast.dart';
import 'package:sphere/core/constants/Const_Colors.dart';
import 'package:sphere/core/constants/Const_Heading.dart';

void flutterToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: ConstColors.seconderyColor,
    textColor: ConstColors.primarycolor,
    fontSize: smallText,
  );
  return;
}
