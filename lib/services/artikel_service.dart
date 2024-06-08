import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/artikel_model.dart';

class ArtikelService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<Artikel>> fetchArtikels() async {
    final response = await http.get(Uri.parse('$baseUrl/artikel'));

    if (response.statusCode == 200) {
      final List<dynamic> artikelsData = json.decode(response.body);
      List<Artikel> artikels = [];

      for (var artikelData in artikelsData) {
        try {
          if (artikelData is List<dynamic> && artikelData.length == 7) {
            artikels.add(Artikel(
              id: artikelData[0] ?? 0,
              judul: artikelData[1] ?? '',
              tanggal: artikelData[2] ?? '',
              isi: artikelData[3] ?? '',
              foto: artikelData[4] ?? '',
              createAt: artikelData[5] ?? '',
              updateAt: artikelData[6] ?? '',
            ));
          } else {
            print('Invalid Artikel data format: $artikelData');
          }
        } catch (e) {
          print('Error parsing Artikel data: $e');
        }
      }

      return artikels;
    } else {
      throw Exception('Failed to load Artikels');
    }
  }

  Future<Artikel> fetchArtikelById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/artikel/$id'));

    if (response.statusCode == 200) {
      final artikelData = json.decode(response.body);

      try {
        if (artikelData is List<dynamic> && artikelData.length == 7) {
          return Artikel(
            id: artikelData[0] ?? 0,
            judul: artikelData[1] ?? '',
            tanggal: artikelData[2] ?? '',
            isi: artikelData[3] ?? '',
            foto: artikelData[4] ?? '',
            createAt: artikelData[5] ?? '',
            updateAt: artikelData[6] ?? '',
          );
        } else {
          print('Invalid Artikel data format: $artikelData');
          throw Exception('Invalid data format');
        }
      } catch (e) {
        print('Error parsing Artikel data: $e');
        throw Exception('Error parsing data');
      }
    } else {
      throw Exception('Failed to load Artikel by ID');
    }
  }
}