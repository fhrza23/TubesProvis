// import 'package:flutter/material.dart';
// import 'daftar_2.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// // import 'package:flutter_recaptcha_v2/flutter_recaptcha_v2.dart';

// class DaftarPage extends StatefulWidget {  
//   @override
//   _DaftarPageState createState() => _DaftarPageState();
// }

// class _DaftarPageState extends State<DaftarPage> {
//   TextEditingController nikController = TextEditingController();
//   TextEditingController namaController = TextEditingController();
//   TextEditingController noHpController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Rawatjalan.id',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.teal[500],
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(100.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center, // Menengahkan horizontal
//               children: [
//                 Text(
//                   'Selamat Datang di Rawatjalan.id',
//                   style: TextStyle(
//                     color: Colors.teal,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 15),
//                 Text(
//                   'Silahkan isi data diri Anda dengan sesuai',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 60),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400, 
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Nomor Induk Kependudukkan',
//                       // suffixIcon: Icon(Icons.assignment_ind),
//                     ),
//                     maxLength: 16,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Nama',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Tanggal Lahir',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Captcha',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 100),
//                 ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DaftarPWPage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(300, 40), 
//                   side: BorderSide(color: Colors.teal, width: 3),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   )
//                 ),
//                 child: Text('Verifikasi Data',style: TextStyle(color: Colors.teal, fontSize: 20)),
//               ),
//             ],
//           ),
//         ),
//             ),
//       ),
//   );
// }
// }
import 'package:flutter/material.dart';
import 'daftar_2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_recaptcha_v2/flutter_recaptcha_v2.dart';

class DaftarPage extends StatefulWidget {  
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        birthDateController.text = "${selectedDate.toLocal()}".split(' ')[0]; // Format tanggal ke yyyy-mm-dd
      });
    }
  }

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
                    controller: nikController,
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
                    controller: namaController,
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
                    controller: birthDateController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    readOnly: true, // Set readOnly untuk mencegah input manual
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
                  child: Text('Verifikasi Data', style: TextStyle(color: Colors.teal, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
