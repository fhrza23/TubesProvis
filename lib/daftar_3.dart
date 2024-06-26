import 'package:flutter/material.dart';
import 'main.dart';

class DaftarConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Rawatjalan.id',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[500],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 350,
                  ),
                  child: Text(
                    'Pendaftaran Berhasil, Silahkan Login Menggunakan NIK anda',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 50),
                    side: BorderSide(color: Colors.teal, width: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Kembali Ke Halaman Awal',style: TextStyle(color: Colors.teal, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}