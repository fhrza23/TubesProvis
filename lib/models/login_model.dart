import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _nik = '';
  String _password = '';
  String _token = '';

  String get nik => _nik;
  String get password => _password;
  String get token => _token;

  void updateNik(String nik) {
    _nik = nik;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  void updateToken(String token) {
    _token = token;
    notifyListeners();
  }
}
