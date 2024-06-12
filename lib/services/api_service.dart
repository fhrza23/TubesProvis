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

class pendaftaranService {
  final String baseUrl = "http://127.0.0.1:8000";

  Future<List<Map<String, dynamic>>> getSpesialis() async {
    final response = await http.get(Uri.parse('$baseUrl/api/spesialis2'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load spesialis list');
    }
  }

  Future<List<Map<String, dynamic>>> getDokterBySpesialis(int spesialisId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/dokter_by_spesialis/$spesialisId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['dokter'];
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load dokter list');
    }
  }

  Future<List<Map<String, dynamic>>> getJadwalDokter(int dokterId, String hari) async {
    final response = await http.get(Uri.parse('$baseUrl/api/jadwal_dokter/$dokterId/$hari'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['jadwal'];
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load jadwal list');
    }
  }

  Future<List<Map<String, dynamic>>> getKeluarga() async {
    final response = await http.get(Uri.parse('$baseUrl/api/keluarga'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load keluarga list');
    }
  }

  Future<List<Map<String, dynamic>>> getAsuransiByKeluarga(int keluargaId) async {

    final response = await http.get(Uri.parse('$baseUrl/api/asuransi_by_keluarga/$keluargaId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['asuransi'];
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load asuransi list');
    }
  }

  Future<void> registerAppointment({
    // required int idUser,
    required int idKeluarga,
    required int idDokter,
    required String namaKeluarga,
    required String selectedDate,
  }) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    // if (token == null) {
    //   throw Exception('Token is null');
    // }
    
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/daftar'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'id_antrian': 1,
          'id_user': 3,
          'id_keluarga': idKeluarga,
          'id_dokter': idDokter,
          'nama_pasien': namaKeluarga,
          'tanggal_janji': selectedDate,
          'no_antrian': 11,
          'kode_qr': 121212,
        }),
      );

      if (response.statusCode == 201) {
        print("Antrian berhasil dibuat");
        // You can return additional data from the response if needed
      } else {
        print(idKeluarga);
        throw Exception('Gagal membuat antrian');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Terjadi kesalahan saat membuat antrian');
    }
  }

}

class qrService {

    final String baseUrl = "http://127.0.0.1:8000";

    Future<List<Map<String, dynamic>>> getAntrian() async {
    final response = await http.get(Uri.parse('$baseUrl/api/getdaftar'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load antrian list');
    }
  }
}