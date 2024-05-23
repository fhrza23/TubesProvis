import 'package:flutter/material.dart';

class DaftarModel extends ChangeNotifier {
  String nik = '';
  String nama = '';
  String noHp = '';
  String password = '';
  String birthDate = '';

  void updateNik(String value) {
    nik = value;
    notifyListeners();
  }

  void updateNama(String value) {
    nama = value;
    notifyListeners();
  }

  void updateNoHp(String value) {
    noHp = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  void updateBirthDate(String value) {
    birthDate = value;
    notifyListeners();
  }
}
