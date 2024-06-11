import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/dokter_model.dart';

class DoctorProfile extends StatelessWidget {
  final Dokter dokter;

  DoctorProfile({required this.dokter});

  @override
  Widget build(BuildContext context) {
    // Sort the schedule by day
    List<Jadwal> sortedJadwal = List.from(dokter.jadwal)
      ..sort((a, b) => _dayOfWeekToInt(a.hari).compareTo(_dayOfWeekToInt(b.hari)));

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
                        backgroundImage: NetworkImage(dokter.foto_dokter),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'images/line.png',
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                    ),
                    Text(
                      dokter.nama_dokter,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Spesialis ${dokter.jenis_spesialis}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    // RatingBar(
                    //   initialRating: dokter.rating,
                    //   allowHalfRating: true,
                    //   itemSize: 23,
                    //   itemCount: 5,
                    //   ratingWidget: RatingWidget(
                    //     full: Icon(Icons.star, color: Colors.black),
                    //     half: Icon(Icons.star_half, color: Colors.black),
                    //     empty: Icon(Icons.star_border, color: Colors.black),
                    //   ),
                    //   onRatingUpdate: (rating) {},
                    // ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 110),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/alumni.png',
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
                                dokter.alumni,
                                style: GoogleFonts.hindMadurai(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 110),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/card-travel.png',
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
                                dokter.pengalaman,
                                style: GoogleFonts.hindMadurai(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 110),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/card.png',
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
                                dokter.nomor_str.toString(),
                                style: GoogleFonts.hindMadurai(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Schedule Table
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(1),
                          1: FlexColumnWidth(2),
                        },
                        border: TableBorder.all(color: Colors.grey),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Hari',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Jam',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          for (var schedule in sortedJadwal)
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      schedule.hari,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      schedule.jam,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
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
                        onPressed: () {},
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
                  child: Row(
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
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
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
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 20),
                  child: Row(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to convert day of week to int
  int _dayOfWeekToInt(String day) {
    switch (day.toLowerCase()) {
      case 'senin':
        return 1;
      case 'selasa':
        return 2;
      case 'rabu':
        return 3;
      case 'kamis':
        return 4;
      case 'jumat':
        return 5;
      case 'sabtu':
        return 6;
      default:
        return 7;
    }
  }
}