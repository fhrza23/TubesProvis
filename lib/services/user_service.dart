import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static Future<bool> registerUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nik': user.nik,
          'nama': user.nama,
          'tanggal_lahir': user.tanggalLahir,
          'no_hp': user.noHp,
          'password': user.password,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}