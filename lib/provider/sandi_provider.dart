// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class PasswordProvider with ChangeNotifier {
//   Future<void> changePassword(String oldPassword, String newPassword, String token) async {
//     final url = Uri.parse('http://127.1.1.0:8000//api/change-password');
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: json.encode({
//         'old_password': oldPassword,
//         'new_password': newPassword,
//       }),
//     );

//     if (response.statusCode == 200) {
//       notifyListeners();
//     } else {
//       throw Exception('Failed to change password');
//     }
//   }
// }
