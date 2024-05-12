import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JadwalDokter(),
    );
  }
}

class JadwalDokter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xFF00897B),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      'images/back.png',
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      'images/notification.png',
                      width: 35,
                      height: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      'images/person.png',
                      width: 35,
                      height: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(top: 65, left: 15, right: 15, bottom: 65),
            decoration: BoxDecoration(
              color: Color(0xFF00897B),
            ),
            child: Column(
              children: [
                Text(
                  'Jadwal Dokter',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'images/jadwal_dokter.png', 
                  width: 500,
                  height: 500, 
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            child: Container(
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
                                'images/location-person.png',
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
                                'images/mail.png',
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
                                'images/call.png',
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
          ),
        ],
      ),
    );
  }
}