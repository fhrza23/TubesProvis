import 'package:flutter/material.dart';
import 'rekam_medis_1.dart';
import 'hasil_pemeriksaan.dart';

class RekamMedisSarahPage extends StatelessWidget {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 112, 99),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset('images/dokter.jpg'),
                SizedBox(height: 8),
                Text(
                  'Rekam Medis\nSarah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 112, 99),
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey, indent: 20, endIndent: 20),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
    padding: const EdgeInsets.all(16.0),
    child: GestureDetector(
      onTap: () {
        // Navigasi ke halaman rekam medis pasien yang sesuai
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HasilPemeriksaanPage()), // Ganti dengan halaman yang sesuai
        );
      },
      child: Row(
        children: [
          // Gambar dokter
          Image.asset(
            'images/dokter.jpg',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama dokter
                Text(
                  'Dr. Ronaldo, Sp. A (K)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat-Bold',
                  ),
                ),
                SizedBox(height: 4),
                // Tanggal dan jam (dengan background abu dan radius)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '14-02-2024 - 13.44',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () {
                    // Aksi yang dijalankan saat tombol "Daftar Lagi" ditekan
                  },
                   style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 112, 99),
                  ),
                  child: Text('Daftar Lagi',
                  style: TextStyle(
                 color: Colors.white, // Warna teks
              ),),
                  
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 8),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}