import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laman Pembayaran Non-Tunai',
      theme: ThemeData(
        primaryColor: Colors.teal,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      home: PayCashlessPage(),
    );
  }
}

class PayCashlessPage extends StatelessWidget{
  

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
              'Pembayaran Non-Tunai',
              style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
            ),
            SizedBox(height: 30), // Spasi antara elemen
            Align(
              alignment: Alignment.center,
              child: Text(
                'Pilih Opsi',
                style: GoogleFonts.montserrat(
                    fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 15),
            Text(
                'Bank:',
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  // Aksi untuk button bank
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12), 
                  child:
                    Image.asset('assets/logo_bank.png', height: 25, width: 40), 
                ),
            ),
            SizedBox(height: 15),
            
            Text(
                'E-Money:',
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  // Aksi untuk button bank
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12), 
                  child:
                    Image.asset('assets/logo_dana.png', height: 25, width: 40), 
                ),
            ),
            SizedBox(height: 60),
            
          ],
        ),
      ),
      ),
    );
  }
}