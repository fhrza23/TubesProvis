import 'package:flutter/material.dart';
import 'rekam_medis_sarah.dart';
import 'penilaian_dokter.dart';

class HasilPemeriksaanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 112, 99),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RekamMedisSarahPage()),
        );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Hasil Pemeriksaan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 112, 99),
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Tanggal Daftar : 14-02-2024',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Dokter : Dr. Ronaldo, Sp. A (K)',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Jam : 13.44',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
                SizedBox(height: 10),
                Text(
                  'Diagnosis',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Pusing, Radang Tenggorokan, Diabetes',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
                SizedBox(height: 10),
                Text(
                  'Resep Obat',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Panadol Extra Kaplet\n2.Metamorfin\n3.Sanexon',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                ),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PenilaianDokterPage()),
                  );
                  },
                   style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 112, 99),
                  ),
                  child: Text('Nilai Dokter',
                  style: TextStyle(
                 color: Colors.white, // Warna teks
              ),
              ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}