import 'package:flutter/material.dart';

class ToggleProvider with ChangeNotifier {
  bool _togglePassword = true;
  bool get togglePassword => _togglePassword;

  void togglePass() {
    _togglePassword = !_togglePassword;
    notifyListeners();
  }

  bool _togglePassword2 = true;
  bool get togglePassword2 => _togglePassword2;

  void togglePass2() {
    _togglePassword2 = !_togglePassword2;
    notifyListeners();
  }

  bool _togglePasswordSignIn = true;
  bool get togglePasswordSignIn => _togglePasswordSignIn;

  void togglePassSignIn() {
    _togglePasswordSignIn = !_togglePasswordSignIn;
    notifyListeners();
  }

}
