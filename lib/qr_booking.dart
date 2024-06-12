import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../screens/dashboard/dashboard.dart';

import '../services/api_service.dart';


class CheckUpPage extends StatefulWidget{
  final qrService _qrService = qrService();
  final int idKeluarga;
  final String selectedDate;

  CheckUpPage({required this.idKeluarga, required this.selectedDate});

  @override
  _CheckUpPageState createState() => _CheckUpPageState();
}

class _CheckUpPageState extends State<CheckUpPage> {
  late int idKeluarga;
  late String selectedDate;

  @override
  void initState() {
    super.initState();
    idKeluarga = widget.idKeluarga;
    selectedDate = widget.selectedDate;
    // Lakukan apa pun yang diperlukan dengan idKeluarga dan selectedDate
  }

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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: widget._qrService.getAntrian(widget.idKeluarga, widget.selectedDate),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No antrian found'));
          } else {
            final antrian = snapshot.data!.first;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Status Pendaftaran',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                    SizedBox(height: 35),
                    Text(
                      'Tanggal Daftar: ${antrian['tanggal_janji']}',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Dokter: ${antrian['nama_dokter']}',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    
                    SizedBox(height: 10),
                    Divider(height: 2),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'QR Booking',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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
                    SizedBox(height: 18),
                    SizedBox(height: 10),
                    Center(
                      child: QrImageView(
                            data: antrian['kode_qr'].toString(),
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                    ),
                    SizedBox(height: 20),
                    Divider(height: 2),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi untuk button "Batalkan Janji"
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
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}