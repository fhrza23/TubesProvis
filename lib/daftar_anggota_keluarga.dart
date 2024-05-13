import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DaftarAnggotaKeluarga(),
    );
  }
}

String _getImagePath(int index) {
  switch (index) {
    case 0:
      return 'assets/Sarah.jpeg';
    case 1:
      return 'assets/BudiSantoso.jpg';
    case 2:
      return 'assets/Maya.jpg';
    default:
      return ''; // Handle jika ada lebih dari 3 item
  }
}

String _getName(int index) {
  switch (index) {
    case 0:
      return 'Sarah';
    case 1:
      return 'Budi Santoso';
    case 2:
      return 'Maya';
    default:
      return ''; // Handle jika ada lebih dari 3 item
  }
}

String _getAge(int index) {
  switch (index) {
    case 0:
      return 'Umur 28';
    case 1:
      return 'Umur 50';
    case 2:
      return 'Umur 17';
    default:
      return ''; // Handle jika ada lebih dari 3 item
  }
}

class DaftarAnggotaKeluarga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 20, bottom: 20),
              child: Text(
                'Daftar Anggota Keluarga',
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.grey,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage(_getImagePath(index)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getName(index),
                            style: GoogleFonts.montserrat(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            _getAge(index),
                            style: GoogleFonts.hindMadurai(
                              fontSize: 17,
                              color: Color(0xFF00897B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}