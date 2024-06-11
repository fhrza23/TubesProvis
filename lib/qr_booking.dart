import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/dashboard/dashboard.dart';

import '../services/api_service.dart';



// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Laman Status Pemeriksaan',
//       theme: ThemeData(
//         primaryColor: Colors.teal,
//         textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
//       ),
//       home: CheckUpPage(),
//     );
//   }
// }

class CheckUpPage extends StatelessWidget{
  

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
                MaterialPageRoute(builder: (context) => Dashboard()),
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
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
              'Status Pendaftaran',
              style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
            ),
            SizedBox(height: 35), // Spasi antara elemen
            Text(
                'Tanggal Daftar: 14-02-2024',
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            SizedBox(height: 5),
            Text(
                'Dokter: Dr. Ronaldo, Sp. A(K)',
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
                'Jadwal: 08.00-14.00',
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Divider(height: 2,),
            SizedBox(height: 15),

            Align(
              alignment: Alignment.center,
              child: Text(
                'QR Booking',
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 5),

            Align(
              alignment: Alignment.center,
              child: Text(
                'Silahkan scan saat tiba di Rumah Sakit',
                style: GoogleFonts.montserrat(
                    fontSize: 16, color: Colors.teal),
              ),
            ),

            SizedBox(height: 5),

            SizedBox(height: 10),
            
            SizedBox(height: 18), // Spasi antara elemen
            
            SizedBox(height: 10),
            Center(
              child: Image.asset('assets/download.png', height: 200, width: 200)
            ),

            SizedBox(height: 20),
            Divider(height: 2,),
            SizedBox(height: 20),

            

            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi untuk button "Selesai"
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10), // Padding vertikal
                  child: Text(
                    'Batalkan Janji',
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
