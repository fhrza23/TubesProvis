import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/notif.dart';
import '../../models/user.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/api";

  // Fetch notifications
  Future<List<Notifikasi>> fetchNotifications() async {
    final response = await http.get(Uri.parse('$baseUrl/notifikasi'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Notifikasi.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }


  Future<User> login(String nik, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'nik': nik,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Asumsikan server mengembalikan user details dalam respons
      return User.fromJson(jsonDecode(response.body));
    } else {
      // Tangani kesalahan
      throw Exception('Failed to login');
    }
  }
}
