import 'package:flutter/material.dart';
import 'daftar_2.dart';

class DaftarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              crossAxisAlignment: CrossAxisAlignment.center, // Menengahkan horizontal
              children: [
                Text(
                  'Selamat Datang di Rawatjalan.id',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  'Silahkan isi data diri Anda dengan sesuai',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400, 
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nomor Induk Kependudukkan',
                      // suffixIcon: Icon(Icons.assignment_ind),
                    ),
                    maxLength: 16,
                  ),
                ),
                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Captcha',
                    ),
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DaftarPWPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 40), 
                  side: BorderSide(color: Colors.teal, width: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: Text('Verifikasi Data',style: TextStyle(color: Colors.teal, fontSize: 20)),
              ),
            ],
          ),
        ),
            ),
      ),
  );
}
}
