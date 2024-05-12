import 'package:flutter/material.dart';
import 'kontentengah.dart';
// import 'pembayaran_nontunai.dart';

import 'dart:convert';

void gatau() {
  String jsonString = '''
  {
    "nama": "Budi Martami",
    "nim": "123456789",
    "semester": 4,
    "mata_kuliah": [
      {
        "kode": "MK101",
        "nama": "Matematika Dasar",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kode": "MK202",
        "nama": "Pemrograman Dasar",
        "sks": 4,
        "nilai": "B+"
      },
      {
        "kode": "MK303",
        "nama": "Struktur Data",
        "sks": 3,
        "nilai": "A-"
      },
      {
        "kode": "MK404",
        "nama": "Basis Data",
        "sks": 3,
        "nilai": "C"
      }
    ]
  }
  ''';

  Map<String, dynamic> transkrip = jsonDecode(jsonString);

  List<Map<String, dynamic>> mataKuliah = List<Map<String, dynamic>>.from(transkrip['mata_kuliah']);

  double totalSKS = 0;
  double totalBobot = 0;

  for (var mk in mataKuliah) {
    double sks = mk['sks'];
    totalSKS += sks;
    totalBobot += hitungBobot(mk['nilai']) * sks;
  }

  double ipk = totalBobot / totalSKS;

  print('Nama: ${transkrip['nama']}');
  print('NIM: ${transkrip['nim']}');
  print('IPK: ${ipk.toStringAsFixed(2)}');
}

double hitungBobot(String nilai) {
  switch (nilai) {
    case 'A':
      return 4.0;
    case 'A-':
      return 3.7;
    case 'B+':
      return 3.3;
    case 'B':
      return 3.0;
    case 'B-':
      return 2.7;
    case 'C+':
      return 2.3;
    case 'C':
      return 2.0;
    case 'C-':
      return 1.7;
    case 'D+':
      return 1.3;
    case 'D':
      return 1.0;
    case 'E':
      return 0.0;
    default:
      return 0.0;
  }
}


void main() => runApp(MyApp());
  // gatau();}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rawatjalan.id',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[500],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            konten(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
