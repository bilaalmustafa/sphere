import 'package:flutter/material.dart';

class StoreProvider with ChangeNotifier {
  TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;
}
