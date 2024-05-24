import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _nik = '';
  String _password = '';

  String get nik => _nik;
  String get password => _password;

  void updateNik(String newNik) {
    _nik = newNik;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }
}
