// import 'package:flutter/material.dart';

// class DaftarModel extends ChangeNotifier {
//   String nik = '';
//   String nama = '';
//   String noHp = '';
//   String password = '';
//   String birthDate = '';

//   void updateNik(String value) {
//     nik = value;
//     notifyListeners();
//   }

//   void updateNama(String value) {
//     nama = value;
//     notifyListeners();
//   }

//   void updateNoHp(String value) {
//     noHp = value;
//     notifyListeners();
//   }

//   void updatePassword(String value) {
//     password = value;
//     notifyListeners();
//   }

//   void updateBirthDate(String value) {
//     birthDate = value;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DaftarModel with ChangeNotifier {
  String _nik = '';
  String _nama = '';
  String _tglLahir = '';
  String _noHp = '';
  String _password = '';

  // Getters
  String get nik => _nik;
  String get nama => _nama;
  String get tglLahir => _tglLahir;
  String get noHp => _noHp;
  String get password => _password;

  // Setters
  void setNik(String nik) {
    _nik = nik;
    notifyListeners();
  }

  void setNama(String nama) {
    _nama = nama;
    notifyListeners();
  }

  void setTglLahir(String tglLahir) {
    _tglLahir = tglLahir;
    notifyListeners();
  }

  void setNoHp(String noHp) {
    _noHp = noHp;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<bool> checkNik(String nik) async {
    if (nik == null || nik.isEmpty) {
      return false;
    }

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/check_nik'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'nik': nik}),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Response data: $responseData');
      return responseData['message'] == 'NIK is available';
    } else {
      throw Exception('Failed to check NIK');
    }
  }
}
