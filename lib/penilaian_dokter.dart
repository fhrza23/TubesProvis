import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'hasil_pemeriksaan.dart';

class PenilaianDokterPage extends StatelessWidget {
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
          MaterialPageRoute(builder: (context) => HasilPemeriksaanPage()),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Penilaian Untuk Dokter',
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
                    'Terima kasih, sudah menggunakan aplikasi ini. Anda boleh berikan penilaian untuk kinerja dokter kami',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 75),
                  Text(
                    'Dokter : Dr. Ronaldo, Sp. A (K)',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat-Bold',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Spesialis Anak',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 75),
                  TextField(
                  decoration: InputDecoration(
                  labelText: 'Masukkan kritik', // Label untuk field
                  border: OutlineInputBorder(), // Jenis border
                  contentPadding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                    },
                     style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 112, 99),
                    ),
                    child: Text('Beri Nilai',
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
      ),
    );
  }
}