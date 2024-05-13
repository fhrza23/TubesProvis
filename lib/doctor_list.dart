import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorList(),
    );
  }
}

String _getImagePath(int index) {
  switch (index) {
    case 0:
      return 'assets/doctor1.jpg';
    case 1:
      return 'assets/doctor2.jpg';
    case 2:
      return 'assets/doctor3.jpg';
    default:
      return '';
  }
}

String _getName(int index) {
  switch (index) {
    case 0:
      return 'dr. Indra Cahya, Sp.THT';
    case 1:
      return 'Dita Anggraini, A.Md.Fis';
    case 2:
      return 'dr. Tri Handoyo, Sp.M';
    default:
      return ''; 
  }
}

String _getSpecialist(int index) {
  switch (index) {
    case 0:
      return 'Spesialis THT';
    case 1:
      return 'Spesialis Fisioterapi';
    case 2:
      return 'Spesialis Mata';
    default:
      return ''; 
  }
}

double _getRating(int index) {
  switch (index) {
    case 0:
      return 4.0;
    case 1:
      return 3.0;
    case 2:
      return 4.5;
    default:
      return 0.0; 
  }
}

class DoctorList extends StatelessWidget {
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
            onPressed: () {
             
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white), 
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20), 
          Padding(
            padding: EdgeInsets.only(left: 18, top: 20, bottom: 20),
            child: Text(
              'Dokter Kami',
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Cari dokter...',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF00897B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        dropdownColor: Color(0xFF00897B),
                        items: <String>['Bedah', 'Anak', 'THT', 'Mata', 'Saraf', 'Gigi', 'Fisioterapi', 'Penyakit Dalam']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          
                        },
                        hint: Text(
                          'Spesialis',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF00897B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        dropdownColor: Color(0xFF00897B),
                        items: <String>[
                          'Senin',
                          'Selasa',
                          'Rabu',
                          'Kamis',
                          'Jumat',
                          'Sabtu',
                          'Minggu'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          
                        },
                        hint: Text(
                          'Hari',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, 
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage(_getImagePath(index)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getName(index),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  _getSpecialist(index),
                                  style: GoogleFonts.hindMadurai(
                                    fontSize: 17,
                                    color: Color(0xFF00897B),
                                  ),
                                ),
                                RatingBar(
                                  initialRating: _getRating(index),
                                  allowHalfRating: true,
                                  itemSize: 23,
                                  itemCount: 5,
                                  ratingWidget: RatingWidget(
                                    full: Icon(Icons.star, color: Colors.black),
                                    half:Icon(Icons.star_half, color: Colors.black),
                                    empty: Icon(Icons.star_border, color: Colors.black),
                                  ),
                                  onRatingUpdate: (rating) {
                                    // Handle rating update
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.teal, // Warna tombol teal
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Profil Dokter',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), 
                    Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}