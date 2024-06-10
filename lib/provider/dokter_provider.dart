import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/dokter_model.dart';
import 'dart:convert';

// class DokterProvider with ChangeNotifier {
//   List<Dokter> _dokterList = [];
//   List<Dokter> _searchResult = [];
//   List<String> _spesialisList = [];

//   List<Dokter> get dokterList => _dokterList;
//   List<Dokter> get searchResult => _searchResult;
//   List<String> get spesialisList => _spesialisList;

//   Future<void> fetchDokter() async {
//     final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/data_dokter'));

//     if (response.statusCode == 200) {
//       final List<dynamic> dokterData = json.decode(response.body);

//       // Print respons yang diterima
//       // print('Response from backend: $dokterData');

//       // Bersihkan daftar dokter sebelum menambahkan data baru
//       _dokterList.clear();

//       // Buat map untuk menyimpan dokter berdasarkan ID dokter
//       Map<int, Dokter> dokterMap = {};

//       for (var dokterDataItem in dokterData) {
//         try {
//           // Periksa apakah dokterDataItem adalah Map<String, dynamic>
//           if (dokterDataItem is Map<String, dynamic>) {
//             int idDokter = dokterDataItem['id_dokter'];

//             // Cek apakah dokter dengan ID tersebut sudah ada di map
//             if (!dokterMap.containsKey(idDokter)) {
//               // Jika belum ada, tambahkan dokter ke map
//               dokterMap[idDokter] = Dokter(
//                 id_dokter: idDokter,
//                 nama_dokter: dokterDataItem['nama_dokter'],
//                 rating: dokterDataItem['rating'],
//                 alumni: dokterDataItem['alumni'],
//                 pengalaman: dokterDataItem['pengalaman'],
//                 nomor_str: dokterDataItem['nomor_str'],
//                 foto_dokter: dokterDataItem['foto_dokter'],
//                 create_at_dokter: dokterDataItem['create_at_dokter'],
//                 update_at_dokter: dokterDataItem['update_at_dokter'],
//                 jenis_spesialis: dokterDataItem['jenis_spesialis'],
//                 hari: dokterDataItem['hari'],
//                 jam: dokterDataItem['jam'],
//               );
//             }
//           } else {
//             // Jika dokterDataItem tidak sesuai dengan format yang diharapkan, lewati
//             print('Invalid dokter data format: $dokterDataItem');
//           }
//         } catch (e) {
//           // Tangani kesalahan jika terjadi
//           print('Error parsing dokter data: $e');
//         }
//       }

//       // Tambahkan semua dokter dari map ke dalam _dokterList
//       _dokterList.addAll(dokterMap.values);

//       // Memberi tahu listener bahwa data telah diperbarui
//       notifyListeners();
//     } else {
//       // Tangani kasus ketika respons tidak 200 (OK)
//       throw Exception('Failed to load dokter');
//     }
//   }

//   Future<void> fetchSpesialis() async {
//     final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/spesialis'));

//     if (response.statusCode == 200) {
//       final List<dynamic> spesialisData = json.decode(response.body);
//       _spesialisList = spesialisData.map((spesialis) => spesialis['jenis_spesialis'] as String).toList();
//       _spesialisList.insert(0, 'Spesialis'); // Menambahkan opsi "Spesialis" di awal daftar
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load spesialis');
//     }
//   }

//   void searchDokter(String query) {
//     if (query.isEmpty) {
//       clearSearchResult();
//       return;
//     }

//     _searchResult = _dokterList
//         .where((dokter) => dokter.nama_dokter.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     notifyListeners();
//   }

//   void filterDokterBySpesialis(String? spesialis) {
//     if (spesialis == null || spesialis == 'Spesialis') {
//       clearSearchResult();
//     } else {
//       _searchResult = _dokterList
//           .where((dokter) => dokter.jenis_spesialis.toLowerCase() == spesialis.toLowerCase())
//           .toList();
//     }
//     notifyListeners();
//   }

//   void clearSearchResult() {
//     _searchResult.clear();
//     notifyListeners();
//   }
// }

// class DokterProvider with ChangeNotifier 
// {
//   List<Dokter> _dokterList = [];
//   List<Dokter> _searchResult = [];
//   List<String> _spesialisList = [];

//   List<Dokter> get dokterList => _dokterList;
//   List<Dokter> get searchResult => _searchResult;
//   List<String> get spesialisList => _spesialisList;

//   Future<void> fetchDokter() async 
//   {
//     final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/data_dokter'));

//     if (response.statusCode == 200) 
//     {
//       final List<dynamic> dokterData = json.decode(response.body);

//       // Print respons yang diterima
//       // print('Response from backend: $dokterData');

//       // Bersihkan daftar dokter dan spesialis sebelum menambahkan data baru
//       _dokterList.clear();
//       _spesialisList.clear();

//       // Buat map untuk menyimpan dokter berdasarkan ID dokter
//       Map<int, Dokter> dokterMap = {};
//       Set<String> spesialisSet = {};

//       for (var dokterDataItem in dokterData) 
//       {
//         try {
//           // Periksa apakah dokterDataItem adalah Map<String, dynamic>
//           if (dokterDataItem is Map<String, dynamic>) 
//           {
//             int idDokter = dokterDataItem['id_dokter'];

//             // Cek apakah dokter dengan ID tersebut sudah ada di map
//             if (!dokterMap.containsKey(idDokter)) {
//               // Jika belum ada, tambahkan dokter ke map
//               dokterMap[idDokter] = Dokter(
//                 id_dokter: idDokter,
//                 nama_dokter: dokterDataItem['nama_dokter'],
//                 rating: dokterDataItem['rating'],
//                 alumni: dokterDataItem['alumni'],
//                 pengalaman: dokterDataItem['pengalaman'],
//                 nomor_str: dokterDataItem['nomor_str'],
//                 foto_dokter: dokterDataItem['foto_dokter'],
//                 create_at_dokter: dokterDataItem['create_at_dokter'],
//                 update_at_dokter: dokterDataItem['update_at_dokter'],
//                 jenis_spesialis: dokterDataItem['jenis_spesialis'],
//                 hari: dokterDataItem['hari'],
//                 jam: dokterDataItem['jam'],
//               );

//               // Tambahkan jenis spesialis ke dalam set
//               spesialisSet.add(dokterDataItem['jenis_spesialis']);
//             }
//           } 
//           else 
//           {
//             // Jika dokterDataItem tidak sesuai dengan format yang diharapkan, lewati
//             print('Invalid dokter data format: $dokterDataItem');
//           }
//         } 
//         catch (e) 
//         {
//           // Tangani kesalahan jika terjadi
//           print('Error parsing dokter data: $e');
//         }
//       }

//       // Tambahkan semua dokter dari map ke dalam _dokterList
//       _dokterList.addAll(dokterMap.values);

//       // Set spesialisasi unik
//       _spesialisList = spesialisSet.toList();
//       _spesialisList.insert(0, 'Spesialis'); // Menambahkan opsi "Spesialis" di awal daftar

//       // Memberi tahu listener bahwa data telah diperbarui
//       notifyListeners();
//     } 
//     else 
//     {
//       // Tangani kasus ketika respons tidak 200 (OK)
//       throw Exception('Failed to load dokter');
//     }
//   }

//   // Hapus metode fetchSpesialis karena sudah diintegrasikan dengan fetchDokter

//   void searchDokter(String query) 
//   {
//     if (query.isEmpty) 
//     {
//       clearSearchResult();
//       return;
//     }

//     _searchResult = _dokterList
//         .where((dokter) => dokter.nama_dokter.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     notifyListeners();
//   }

//   void filterDokterBySpesialis(String? spesialis) 
//   {
//     if (spesialis == null || spesialis == 'Spesialis') 
//     {
//       clearSearchResult();
//     } 
//     else 
//     {
//       _searchResult = _dokterList
//           .where((dokter) => dokter.jenis_spesialis.toLowerCase() == spesialis.toLowerCase())
//           .toList();
//     }
//     notifyListeners();
//   }

//   void clearSearchResult() 
//   {
//     _searchResult.clear();
//     notifyListeners();
//   }
// }

class DokterProvider with ChangeNotifier 
{
  List<Dokter> _dokterList = [];
  List<Dokter> _searchResult = [];
  List<String> _spesialisList = [];
  List<String> _hariList = [];

  List<Dokter> get dokterList => _dokterList;
  List<Dokter> get searchResult => _searchResult;
  List<String> get spesialisList => _spesialisList;
  List<String> get hariList => _hariList;

  Future<void> fetchDokter() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/data_dokter'));

    if (response.statusCode == 200) {
      final List<dynamic> dokterData = json.decode(response.body);

      _dokterList.clear();
      _spesialisList.clear();
      // _hariList.clear();

      Map<int, Dokter> dokterMap = {};
      Set<String> spesialisSet = {};
      Set<String> hariSet = {};

      for (var dokterDataItem in dokterData) {
        try {
          if (dokterDataItem is Map<String, dynamic>) {
            int idDokter = dokterDataItem['id_dokter'];

            if (!dokterMap.containsKey(idDokter)) {
              dokterMap[idDokter] = Dokter(
                id_dokter: idDokter,
                nama_dokter: dokterDataItem['nama_dokter'],
                rating: dokterDataItem['rating'],
                alumni: dokterDataItem['alumni'],
                pengalaman: dokterDataItem['pengalaman'],
                nomor_str: dokterDataItem['nomor_str'],
                foto_dokter: dokterDataItem['foto_dokter'],
                create_at_dokter: dokterDataItem['create_at_dokter'],
                update_at_dokter: dokterDataItem['update_at_dokter'],
                jenis_spesialis: dokterDataItem['jenis_spesialis'],
                hari: dokterDataItem['hari'],
                jam: dokterDataItem['jam'],
              );

              spesialisSet.add(dokterDataItem['jenis_spesialis']);
              hariSet.add(dokterDataItem['hari']);
            }

          } else {
            print('Invalid dokter data format: $dokterDataItem');
          }
        } catch (e) {
          print('Error parsing dokter data: $e');
        }
      }

      _dokterList.addAll(dokterMap.values);
      
      _spesialisList = spesialisSet.toList();
      _spesialisList.insert(0, 'Spesialis');

      _hariList = hariSet.toList();
      _hariList.insert(0, 'Semua');

      notifyListeners();
    } else {
      throw Exception('Failed to load dokter');
    }
  }

  void searchDokter(String query) 
  {
    if (query.isEmpty) 
    {
      clearSearchResult();
      return;
    }

    _searchResult = _dokterList
        .where((dokter) => dokter.nama_dokter.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  void filterDokterBySpesialis(String? spesialis) 
  {
    if (spesialis == null || spesialis == 'Spesialis') 
    {
      clearSearchResult();
    } 
    else 
    {
      _searchResult = _dokterList
          .where((dokter) => dokter.jenis_spesialis.toLowerCase() == spesialis.toLowerCase())
          .toList();
    }
    notifyListeners();
  }

  void filterDokterByHari(String? hari) {
    if (hari == null || hari == 'Semua') {
      clearSearchResult();
    } else {
      _searchResult = _dokterList
          .where((dokter) => dokter.hari.toLowerCase() == hari.toLowerCase())
          .toList();
    }
    notifyListeners();
  }

  void clearSearchResult() 
  {
    _searchResult.clear();
    notifyListeners();
  }
}