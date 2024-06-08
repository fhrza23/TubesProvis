import 'package:flutter/material.dart';
import 'rekam_medis_sarah.dart';
import 'screens/dashboard-notifikasi/dashboard.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RekamMedis(),
    );
  }
}

class RekamMedis extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => Dashboard())
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
                Image.asset('images/dokter.jpg'),
                SizedBox(height: 8),
                Text(
                  'Rekam Medis',
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
                _buildPasien(context, 'Sarah', 'Umur 28 tahun', 'Peserta', 'images/Sarah.jpg'),
                SizedBox(height: 8),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
                SizedBox(height: 8),
                _buildPasien(context, 'Budi Santoso', 'Umur 50 tahun', 'Suami', 'images/Budi Santoso.jpg'),
                SizedBox(height: 8),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
                SizedBox(height: 8),
                _buildPasien(context, 'Maya', 'Umur 17 tahun', 'Anak', 'images/Maya.jpg'),
                SizedBox(height: 8),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasien(BuildContext context, String name, String age, String participant, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          // Navigasi ke halaman rekam medis pasien yang sesuai
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RekamMedisSarahPage()), // Ganti dengan halaman yang sesuai
          );
        },
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    age,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 112, 99),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    participant,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
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