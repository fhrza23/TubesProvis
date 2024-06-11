import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> fetchUser(String token) async {
    final response = await http.get(
      Uri.parse('https://127.0.0.1:8000/api/user'), // Mengubah endpoint ke '/api/me'
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      _user = UserModel.fromJson(json.decode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to load user');
    }
  }
  
  Future<void> registerUser(UserModel newUser) async {
    final response = await http.post(
      Uri.parse('https://127.0.0.1:8000/api/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newUser.toJson()),
    );

    if (response.statusCode == 201) {
      _user = UserModel.fromJson(json.decode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<void> loginUser(String nik, String password) async {
    final response = await http.post(
      Uri.parse('https://127.0.0.1:80000/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'nik': nik, 'password': password}),
    );

    if (response.statusCode == 200) {
      _user = UserModel.fromJson(json.decode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to login');
    }
  }
  
  // Get token method for debugging
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // Use 'token' instead of 'fcmToken'
    print("Retrieved token: $token");

    if (token != null && !token.isEmpty) {
      return token;
    } else {
      return null;
    }
  }

  //ubah password
    Future<void> changePassword(String oldPassword, String newPassword, String token) async {
    final url = Uri.parse('https://127.0.0.1:80000/api/change-password');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'old_password': oldPassword,
        'new_password': newPassword,
      }),
    );

    if (response.statusCode == 200) {
      // notifyListeners();
    } else {
      throw Exception('Failed to change password');
    }
  }
}
