import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'status_pemeriksaan.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laman Status Pemeriksaan',
      theme: ThemeData(
        primaryColor: Colors.teal,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      home: AbortCheckUpPage(),
    );
  }
}

class AbortCheckUpPage extends StatelessWidget{
  final TextEditingController alasanController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal, 
          leading: IconButton(
            icon: Icon(Icons.arrow_circle_left, color: Colors.white), 
            onPressed: () {
              
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
            SizedBox(height: 60), // Spasi antara elemen
            

            
            RichText(
              text: TextSpan(
                text: 
                'Dengan ini saya pasien atas nama Sarah, dengan kode booking ',
                style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: '7b3334hy67', // Kode booking
                    style: GoogleFonts.montserrat(fontSize: 16, color: Colors.teal),
                    children: [
                      TextSpan(
                        text: ', ingin membatalkan Pendaftaran Online Rawat Jalan saya dengan alasan:',
                        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  )
                ]
              ),
            ),
            SizedBox(height: 18), // Jarak antar elemen
            TextField(
              controller: alasanController, // Controller untuk input teks
              maxLines: 4, // Membuat textbox yang besar
              decoration: InputDecoration(
                hintText: 'Masukkan alasan pembatalan', // Petunjuk teks dalam textbox
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Persegi bersudut bulat
                  borderSide: BorderSide(color: Colors.teal), // Warna garis batas
                ),
              ),
            ),
            SizedBox(height: 18), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Agar tombol sejajar
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Warna abu-abu untuk tombol kembali
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                    child:
                      Text(
                        'Kembali', 
                        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white), 
                      ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk membatalkan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                    child:
                      Text(
                        'Batalkan', 
                        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white), 
                      ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}