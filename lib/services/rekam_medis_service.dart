import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/models/rekam_medis_model.dart';

class RekamMedisService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<RekamMedis>> fetchRekamMedis() async {
    final response = await http.get(Uri.parse('$baseUrl/rekam_medis/9'));

    if (response.statusCode == 200) {
      final List<dynamic> rekamMedisData = json.decode(response.body);
      List<RekamMedis> rekamMedisList = [];

      for (var data in rekamMedisData) {
        try {
          RekamMedis rekamMedis = RekamMedis.fromJson(data);
          rekamMedisList.add(rekamMedis);
          print('Rekam Medis Data: ${rekamMedis.namaKeluarga}, ${rekamMedis.tglLahir}, ${rekamMedis.nik}');
        } catch (e) {
          print('Error parsing Rekam Medis data: $e');
        }
      }

      return rekamMedisList;
    } else {
      throw Exception('Failed to load Rekam Medis');
    }
  }
}