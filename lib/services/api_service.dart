import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/notif.dart';
import '../../models/user.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/api";

  // Fetch notifications
  Future<List<Notifikasi>> fetchNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) {
      throw Exception('Token is null');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/notifikasi'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = jsonDecode(response.body);
    if (responseBody is List) {
      final notificationsList = responseBody.map((data) => Notifikasi.fromJson(data)).toList();
      return notificationsList;
    } else if (responseBody is Map) {
      final data = responseBody['data'];
      if (data is List) {
        final notificationsList = data.map((data) => Notifikasi.fromJson(data)).toList();
      } else {
        // Handle unexpected response structure
        throw Exception('Unexpected response format');
      }
    } else {
      // Handle unexpected response type
      throw Exception('Unexpected response type');
    }

  return [];
  }

  // Login
  Future<User> login(String nik, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
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
      // var responseData = jsonDecode(response.body);
      // String token = responseData['access_token'];

      // // Save the token
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', token);
      final token = jsonDecode(response.body)['access_token'];
      print("Access token: $token");

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      print('Token saved: $token');

      // Assume server returns user details in the response
      // return User.fromJson(responseData);
      return User.fromJson(token);
    } else {
      // Handle error with more specific exception
      throw LoginException('Failed to login (Status Code: ${response.statusCode})');
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
    final url = Uri.parse('$baseUrl/change-password');
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

// Consider creating a LoginException class with more information
class LoginException implements Exception {
  final String message;

  LoginException(this.message);
}
