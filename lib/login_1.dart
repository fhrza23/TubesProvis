import 'package:flutter/material.dart';
import 'sandi_1.dart';
import 'dashboard.dart';

class LoginPage extends StatelessWidget {
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
                  'Masuk ke Akun Anda',
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
                    maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
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
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  // Aksi ketika tombol login ditekan
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50), 
                  side: BorderSide(color: Colors.teal, width: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: Text('Masuk',style: TextStyle(color: Colors.teal, fontSize: 20)),
              ),
                SizedBox(height: 20),
                GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SandiPage()), // Ganti ForgotPasswordPage dengan nama halaman yang sesuai
                  );
                },
                child: Text(
                  'Lupa Kata Sandi?',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
