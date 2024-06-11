import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/notif.dart';
import '../../models/user_model.dart';

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
}