import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/dokter_model.dart';
import 'dart:convert';

class DokterProvider with ChangeNotifier {
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
      _hariList.clear();

      Map<int, Dokter> dokterMap = {};
      Set<String> spesialisSet = {};
      Set<String> hariSet = {};

      for (var dokterDataItem in dokterData) {
        try {
          if (dokterDataItem is Map<String, dynamic>) {
            int idDokter = dokterDataItem['id_dokter'];

            if (!dokterMap.containsKey(idDokter)) {
              dokterMap[idDokter] = Dokter.fromJson(dokterDataItem);
              spesialisSet.add(dokterDataItem['jenis_spesialis']);
            }

            var jadwal = dokterDataItem['jadwal'] as List;
            for (var jadwalItem in jadwal) {
              hariSet.add(jadwalItem['hari']);
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
      _hariList.insert(0, 'Hari');

      notifyListeners();
    } else {
      throw Exception('Failed to load dokter');
    }
  }

  Future<void> fetchDokterById(int id_dokter) async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/data_dokter/$id_dokter'));

  if (response.statusCode == 200) {
    final dokterDataItem = json.decode(response.body);

    try {
      if (dokterDataItem is Map<String, dynamic>) {
        Dokter dokter = Dokter.fromJson(dokterDataItem);

        // Ensure the dokter is not already in the list
        if (!_dokterList.any((d) => d.id_dokter == dokter.id_dokter)) {
          _dokterList.add(dokter);

          // Update spesialis and hari lists if they are not already present
          if (!_spesialisList.contains(dokter.jenis_spesialis)) {
            _spesialisList.add(dokter.jenis_spesialis);
          }
          
          for (var jadwalItem in dokter.jadwal) {
            if (!_hariList.contains(jadwalItem.hari)) {
              _hariList.add(jadwalItem.hari);
            }
          }

          notifyListeners();
        }
      } else {
        print('Invalid dokter data format: $dokterDataItem');
        throw Exception('Invalid data format');
      }
    } catch (e) {
      print('Error parsing dokter data: $e');
      throw Exception('Error parsing data');
    }
  } else {
    throw Exception('Failed to load dokter by ID');
  }
}

  void searchDokter(String query) {
    if (query.isEmpty) {
      clearSearchResult();
      return;
    }

    _searchResult = _dokterList
        .where((dokter) =>
            dokter.nama_dokter.toLowerCase().contains(query.toLowerCase()))
        .toList();

    notifyListeners();
  }

  void filterDokterBySpesialisDanHari(String? spesialis, String? hari) {
    if ((spesialis == null || spesialis == 'Spesialis') &&
        (hari == null || hari == 'Hari')) {
      clearSearchResult();
    } else if (spesialis == null || spesialis == 'Spesialis') {
      _searchResult = _dokterList
          .where((dokter) => dokter.jadwal.any((jadwalItem) =>
              jadwalItem.hari.toLowerCase() == hari?.toLowerCase()))
          .toList();
    } else if (hari == null || hari == 'Hari') {
      _searchResult = _dokterList
          .where((dokter) =>
              dokter.jenis_spesialis.toLowerCase() == spesialis.toLowerCase())
          .toList();
    } else {
      _searchResult = _dokterList
          .where((dokter) =>
              dokter.jenis_spesialis.toLowerCase() == spesialis.toLowerCase())
          .where((dokter) => dokter.jadwal.any((jadwalItem) =>
              jadwalItem.hari.toLowerCase() == hari.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void filterDokterBySpesialis(String? spesialis) {
    if (spesialis == null || spesialis == 'Spesialis') {
      clearSearchResult();
    } else {
      _searchResult = _dokterList
          .where((dokter) =>
              dokter.jenis_spesialis.toLowerCase() == spesialis.toLowerCase())
          .toList();
    }
    notifyListeners();
  }

  void filterDokterByHari(String? hari) {
    if (hari == null || hari == 'Hari') {
      clearSearchResult();
    } else {
      _searchResult = _dokterList
          .where((dokter) => dokter.jadwal.any((jadwalItem) =>
              jadwalItem.hari.toLowerCase() == hari?.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearchResult() {
    _searchResult.clear();
    notifyListeners();
  }
}