import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_profile.dart';

// void main() {
//   runApp(MyApp());
// }

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
      return 'images/Sarah.jpeg';
    case 1:
      return 'images/BudiSantoso.jpg';
    case 2:
      return 'images/Maya.jpg';
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
                      MaterialPageRoute(builder: (context) => UserProfile()),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
          SizedBox(height: 10), 
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
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
        ],
      ),
    );
  }
}