import 'package:flutter/material.dart';

class SellerProvider with ChangeNotifier {
  TextEditingController _brandnameContoller = TextEditingController();
  TextEditingController _descriptionContoller = TextEditingController();

  TextEditingController get brandnameContoller => _brandnameContoller;
  TextEditingController get descriptionContoller => _descriptionContoller;
}
