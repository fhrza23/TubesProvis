import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/jadwal_dokter.dart';
import 'package:http/http.dart' as http;
import '../models/dokter.dart';
import 'dart:convert';

class DokterProvider with ChangeNotifier {
  List<dynamic> _dokterList = [];
  List<String> _spesialisList = [];

  List<dynamic> get dokterList => _dokterList;
  List<String> get spesialisList => _spesialisList;

  // Future<void> fetchDokters() async {
  //   final url = 'http://127.0.0.1:8000/api/dokter'; // Ganti dengan alamat FastAPI Anda
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     _dokterList = json.decode(response.body);
  //     notifyListeners();
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  Future<void> fetchDokter() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/dokter'));

    if (response.statusCode == 200) {
      final List<dynamic> JadwalDokterData = json.decode(response.body);

      // Print respons yang diterima
        // print('Response from backend: $JadwalDokterData');

      // Bersihkan daftar pengguna sebelum menambahkan data baru
      _dokterList.clear();

      for (var jadwalDokterData in JadwalDokterData) {
        try {
          // Periksa apakah jadwalDokterData adalah List<dynamic> dengan panjang yang sesuai
          if (jadwalDokterData is List<dynamic> &&
              jadwalDokterData.length == 10) {
            // Gunakan indeks untuk mengakses properti data pengguna
            _dokterList.add(Dokter(
              id_dokter: jadwalDokterData[0],
              nama_dokter: jadwalDokterData[1],
              spesialis: jadwalDokterData[2],
              hari_praktek: jadwalDokterData[3],
              jam_praktek: jadwalDokterData[4],
              rating: jadwalDokterData[5],
              alumni: jadwalDokterData[6],
              pengalaman: jadwalDokterData[7],
              nomor_str: jadwalDokterData[8],
              foto_dokter: jadwalDokterData[9],
            ));
          } else {
            // Jika jadwalDokterData tidak sesuai dengan format yang diharapkan, lewati
            print('Invalid dokter data format: $jadwalDokterData');
          }
        } catch (e) {
          // Tangani kesalahan jika terjadi
          print('Error parsing dokter data: $e');
        }
      }

      // Memberi tahu listener bahwa data telah diperbarui
      notifyListeners();
    } else {
      // Tangani kasus ketika respons tidak 200 (OK)
      throw Exception('Failed to load dokter');
    }
  }

  Future<void> fetchSpesialis() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/spesialis'));

    if (response.statusCode == 200) {
      final List<String> spesialisData = List<String>.from(json.decode(response.body));

      _spesialisList = spesialisData;
      notifyListeners();
    } else {
      throw Exception('Failed to load spesialis');
    }
  }
}
