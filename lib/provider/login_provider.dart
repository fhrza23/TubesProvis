import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../models/login_model.dart';
import '../screens/dashboard/dashboard.dart';
import '../screens/profil/sandi_1.dart';

class LoginProvider with ChangeNotifier {
  Future<void> loginUser(String nik, String password, BuildContext context) async {
    var url = 'http://127.0.0.1:8000/api/login';

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'nik': nik,
        'password': password,
      }),
    );

    print("Response status code: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['access_token'];
      print("Access token: $token");
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('token', token);
      });

      // Berhasil login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else if (response.statusCode == 401) {
      // Gagal login, menampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Gagal Masuk"),
            content: Text("NIK atau kata sandi salah. Silakan coba lagi."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Menangani error lain seperti HTTP 500
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Terjadi kesalahan pada server. Silakan coba lagi nanti."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
