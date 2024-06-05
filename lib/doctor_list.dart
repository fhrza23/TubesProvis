import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'provider/dokter_provider.dart';
import 'models/dokter.dart';
import 'screens/dashboard-notifikasi/dashboard.dart';

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  String? selectedSpesialis;
  
  @override
  void initState() {
    super.initState();
    Provider.of<DokterProvider>(context, listen: false).fetchDokter();
    Provider.of<DokterProvider>(context, listen: false).fetchSpesialis();
  }

  Widget build(BuildContext context) {
    final dokterProvider = Provider.of<DokterProvider>(context);
    final spesialisList = dokterProvider.spesialisList;

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
                        SizedBox(width: 14),
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
                        SizedBox(width: 20),
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
                        value: selectedSpesialis,
                        items: spesialisList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedSpesialis = value;
                          });
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
              itemCount: dokterProvider.dokterList.length,
              itemBuilder: (context, index) {
                Dokter dokter = dokterProvider.dokterList[index];
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
                              backgroundImage: NetworkImage(dokter.foto_dokter),
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
                                  dokter.nama_dokter,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Spesialis ${dokter.spesialis}',
                                  style: GoogleFonts.hindMadurai(
                                    fontSize: 17,
                                    color: Color(0xFF00897B),
                                  ),
                                ),
                                RatingBar(
                                  initialRating: dokter.rating,
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