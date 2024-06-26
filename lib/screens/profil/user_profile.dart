// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/main.dart';
// import 'package:flutter_application_2/screens/profil/daftar_anggota_keluarga.dart';
// import 'package:flutter_application_2/screens/profil/sandi_1.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../dashboard/dashboard.dart';
// import 'daftar_anggota_keluarga.dart';
// import 'sandi_1.dart';

// class UserProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Profil User',
//       theme: ThemeData(
//         primaryColor: Colors.teal,
//         textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
//       ),
//       home: UserProfile(),
//     );
//   }
// }

// class UserProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//       SharedPreferences.getInstance().then((prefs) {
//       String? token = prefs.getString('token');
//       print('Token: $token');
//       // Lakukan sesuatu dengan token
//   // print('Token before request: $token');
//     });
//     return Scaffold(
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF00897B),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(80),
//                     bottomRight: Radius.circular(80),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(
//                               context, 
//                               // MaterialPageRoute(builder: (context) => Dashboard())
//                             );
//                           },
//                           child: IconButton(
//                                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                             onPressed: () {
//                               Navigator.push(
//                                 context, 
//                                 MaterialPageRoute(builder: (context) => Dashboard()));}
//                           )
//                           // child: IconButton(
//                           //   icon: Icon(Icons.arrow_circle_left, color: Colors.white), 
//                           //   onPressed: () {
//                           //     Navigator.push(
//                           //       context, 
//                           //       MaterialPageRoute(builder: (context) => Dashboard())
//                           //     );
//                           //   },
//                           // ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage: AssetImage('images/Sarah.jpeg'),
//                     ),
//                     SizedBox(height: 80),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20), 
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                 child: Container(
//                   transform: Matrix4.translationValues(0.0, -80.0, 0.0),
//                   child: Center(
//                     child: Container(
//                       width: 350,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 20, bottom: 20),
//                         child: Center(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Sarah',
//                                 style: GoogleFonts.montserrat(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 '012345678910',
//                                 style: GoogleFonts.montserrat(
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 35), 
//             child: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute
//                         (
//                           builder: (context) => DaftarAnggotaKeluarga(),
//                         ),
//                       );
//                     },
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context, 
//                               MaterialPageRoute(builder: (context) => DaftarAnggotaKeluarga())
//                             );
//                           },
//                           child: Row(  // Use Row to place items horizontally
//                             children: [
//                               Image.asset(
//                                 'images/family.png',
//                                 width: 20,
//                                 height: 20,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 25),
//                               Text(
//                                 'Daftar Anggota Keluarga',
//                                 style: GoogleFonts.montserrat(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: EdgeInsets.only(left: 35),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                           SharedPreferences.getInstance().then((prefs) {
//       String? token = prefs.getString('token');
//       print('Token: $token');
//       // Lakukan sesuatu dengan token
//   // print('Token before request: $token');
//     });
//                     Navigator.push(
//                       context, 
//                       MaterialPageRoute(builder: (context) => SandiPage())
//                     );
//                   },
//                   child: Row(  // Use Row to place items horizontally
//                     children: [
//                       Image.asset(
//                         'images/password.png',
//                         width: 20,
//                         height: 20,
//                         color: Colors.black,
//                       ),
//                       SizedBox(width: 25),
//                       Text(
//                         'Ubah Kata Sandi',
//                         style: GoogleFonts.montserrat(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             // child: GestureDetector(
//             //   onTap: () {},
//             //   child: Container(
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //       children: [
//             //         GestureDetector(
//             //           onTap: () {
//             //             Navigator.of(context).push(
//             //               MaterialPageRoute
//             //               (
//             //                 builder: (context) => SandiPage(),
//             //               ),
//             //             );
//             //           },
//             //           child: Row(
//             //             children: [
//             //               Image.asset(
//             //                 'images/password.png',
//             //                 width: 20,
//             //                 height: 20,
//             //                 color: Colors.black,
//             //               ),
//             //               SizedBox(width: 25), 
//             //               Text(
//             //                 'Ubah Kata Sandi',
//             //                 style: GoogleFonts.montserrat(
//             //                   fontSize: 15,
//             //                   fontWeight: FontWeight.bold,
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         )
//             //       ],
//             //     ),
//             //   ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: EdgeInsets.only(left: 35, bottom: 290), 
//             child: GestureDetector(
//               onTap: () {
//                           Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(
//                               builder: (context) => HomeScreen(),
//                             ),
//                             (Route<dynamic> route) => false,
//                           );
//                         },
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           'images/log-out.png',
//                           width: 20,
//                           height: 20,
//                           color: Colors.black,
//                         ),
//                         SizedBox(width: 25),
//                         Text(
//                           'Keluar',
//                           style: GoogleFonts.montserrat(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Container(
//               color: Color(0xFF00897B),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 5),
//                   Padding(
//                     padding: EdgeInsets.only(left: 16, top: 20),
//                     child: Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 'images/location-person.png',
//                                 width: 20,
//                                 height: 20,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Jalan Rumah Sehat No 01',
//                                 style: GoogleFonts.montserrat(
//                                   fontSize: 15,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Padding(
//                     padding: EdgeInsets.only(left: 16),
//                     child: Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 'images/mail.png',
//                                 width: 20,
//                                 height: 20,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'rawatjalan@gmail.com',
//                                 style: GoogleFonts.montserrat(
//                                   fontSize: 15,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Padding(
//                     padding: EdgeInsets.only(left: 16, bottom: 20),
//                     child: Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(
//                                 'images/call.png',
//                                 width: 20,
//                                 height: 20,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 '021-1234567890',
//                                 style: GoogleFonts.montserrat(
//                                   fontSize: 15,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/screens/profil/daftar_anggota_keluarga.dart';
import 'package:flutter_application_2/screens/profil/sandi_1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../dashboard/dashboard.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil User',
      theme: ThemeData(
        primaryColor: Colors.teal,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      home: UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/me'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          userData = json.decode(response.body);
        });
      } else {
        // Handle error
        print('Failed to load user data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF00897B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Dashboard()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/Sarah.jpeg'),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                  child: Center(
                    child: Container(
                      width: 350,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Text(
                              //   userData != null ? userData!['first_name'] + ' ' + userData!['last_name'] : 'Loading...',
                              //   style: GoogleFonts.montserrat(
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              Text(
                                userData != null ? userData!['nik'] : 'Loading...',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Other widgets...
        ],
      ),
    );
  }
}
