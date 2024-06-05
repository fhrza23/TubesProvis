import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/artikel.dart';

class ArtikelService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<Artikel>> fetchArtikels() async {
    final response = await http.get(Uri.parse('$baseUrl/artikel'));

    if (response.statusCode == 200) {
      final List<dynamic> ArtikelsData = json.decode(response.body);
      List<Artikel> artikels = [];

      for (var ArtikelData in ArtikelsData) {
        try {
          if (ArtikelData is List<dynamic> && ArtikelData.length == 5) {
            artikels.add(Artikel(
              id: ArtikelData[0],
              judul: ArtikelData[1],
              tanggal: ArtikelData[2],
              isi: ArtikelData[3],
              foto: ArtikelData[4],
            ));
          } else {
            print('Invalid Artikel data format: $ArtikelData');
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
      final ArtikelData = json.decode(response.body);

      try {
        if (ArtikelData is List<dynamic> && ArtikelData.length == 5) {
          return Artikel(
            id: ArtikelData[0],
            judul: ArtikelData[1],
            tanggal: ArtikelData[2],
            isi: ArtikelData[3],
            foto: ArtikelData[4],
          );
        } else {
          print('Invalid Artikel data format: $ArtikelData');
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
