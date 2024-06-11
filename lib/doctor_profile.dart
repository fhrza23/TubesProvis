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
      home: DoctorProfile(),
    );
  }
}

class DoctorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF00897B), 
                          width: 7, 
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 130, 
                        backgroundImage: AssetImage('assets/doctor1.jpg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/line.png',
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                    ),
                    Text(
                      'dr. Indra Cahya, Sp.THT',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Spesialis THT',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    RatingBar(
                      initialRating: 4,
                      allowHalfRating: true,
                      itemSize: 23,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: Icon(Icons.star, color: Colors.black),
                        half:Icon(Icons.star_half, color: Colors.black),
                        empty: Icon(Icons.star_border, color: Colors.black),
                      ),
                      onRatingUpdate: (rating) {
                        
                      },
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 110), 
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/alumni.png',
                                  width: 35,
                                  height: 35,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10), 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Alumni',
                                      style: GoogleFonts.hindMadurai(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      'Universitas Indonesia 2011', 
                                      style: GoogleFonts.hindMadurai(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 110), 
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/card-travel.png',
                                  width: 35,
                                  height: 35,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10), 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pengalaman',
                                      style: GoogleFonts.hindMadurai(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '12 Tahun',
                                      style: GoogleFonts.hindMadurai(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 110, bottom: 15),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/card.png',
                                  width: 35,
                                  height: 35,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nomor STR',
                                      style: GoogleFonts.hindMadurai(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '3624612414124', 
                                      style: GoogleFonts.hindMadurai(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 39),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xFF00897B), 
                          width: 2,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                         
                        },
                        child: Text(
                          'Atur Jadwal', 
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF00897B), 
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, 
                          elevation: 0, 
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Color(0xFF00897B),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/location-person.png',
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Jalan Rumah Sehat No 01',
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/mail.png',
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'rawatjalan@gmail.com',
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/call.png',
                              width: 20,
                              height: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '021-1234567890',
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
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
