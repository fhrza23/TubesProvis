import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';

String _getDay(int index) {
  switch (index) {
    case 0:
      return 'Rabu & Kamis';
    case 1:
      return 'Senin s.d Sabtu';
    case 2:
      return 'Senin & Jumat';
    default:
      return '';
  }
}

String _getTime(int index) {
  switch (index) {
    case 0:
      return '12.00 WIB';
    case 1:
      return '18.30 WIB';
    case 2:
      return '15.30 WIB';
    default:
      return '';
  }
}

String _getImagePath(int index) {
  switch (index) {
    case 0:
      return 'images/doctor1.jpg';
    case 1:
      return 'images/doctor2.jpg';
    case 2:
      return 'images/doctor3.jpg';
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

class JadwalDokter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, 
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left, color: Colors.white), 
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
            padding: const EdgeInsets.only(left: 18, top: 20, bottom: 20),
            child: Text(
              'Jadwal Dokter',
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.03),
                            spreadRadius: 10,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _getDay(index),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      _getTime(index),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(_getImagePath(index)), 
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _getName(index),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      _getSpecialist(index),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: Color(0xFF00897B),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 20),
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
                          const SizedBox(width: 10),
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
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
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
                          const SizedBox(width: 10),
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
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 20),
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
                          const SizedBox(width: 10),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}