import 'package:flutter/material.dart';

class StoreProfileProvider with ChangeNotifier {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _disPriceController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _stuckController = TextEditingController();
  TextEditingController _discriptionController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get disPriceController => _disPriceController;
  TextEditingController get priceController => _priceController;
  TextEditingController get stuckController => _stuckController;
  TextEditingController get discriptionController => _discriptionController;
}
