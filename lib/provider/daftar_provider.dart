import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DaftarProvider extends ChangeNotifier {
  late String _nik;
  late String _nama;
  late String _tglLahir;
  late String _noHp;
  late String _password;

  String get nik => _nik;
  String get nama => _nama;
  String get tglLahir => _tglLahir;
  String get noHp => _noHp;
  String get password => _password;

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
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/check_nik'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'nik': nik}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['available'];
    } else {
      throw Exception('Failed to check NIK');
    }
  }

  Future<void> registerUser() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nik': _nik,
        'nama': _nama,
        'tgl_lahir': _tglLahir,
        'no_hp': _noHp,
        'password': _password,
      }),
    );

    if (response.statusCode == 201) {
      // User registered successfully
    } else {
      throw Exception('Failed to register user');
    }
  }
}
