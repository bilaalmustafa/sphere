import 'package:flutter/material.dart';

class LogInControllerPrivoder with ChangeNotifier {
  TextEditingController _loginemailController = TextEditingController();
  TextEditingController _loginpasswordController = TextEditingController();

  TextEditingController get loginemailController => _loginemailController;
  TextEditingController get loginpasswordController => _loginpasswordController;
}
