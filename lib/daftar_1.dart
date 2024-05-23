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
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'daftar_2.dart';
import 'model/daftar_model.dart';

class UserData extends ChangeNotifier {
  String nik = '';
  String nama = '';
  String tanggalLahir = '';

  void setUserData(String newNik, String newNama, String newTanggalLahir) {
    nik = newNik;
    nama = newNama;
    tanggalLahir = newTanggalLahir;
    notifyListeners();
  }
}

class DaftarPage extends StatefulWidget {
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      birthDateController.text = "${selectedDate.toLocal()}".split(' ')[0]; // Format tanggal ke yyyy-mm-dd
    }
  }

  Future<bool> _checkNIK(String nik) async {
    if (nik == null || nik.isEmpty) {
      return false;
    }

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/check_nik'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'nik': nik}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'] == 'NIK is available';
    } else {
      throw Exception('Failed to check NIK');
    }
  }

  void _verifyData(BuildContext context) async {
    String nik = nikController.text;

    try {
      bool isAvailable = await _checkNIK(nik);
      if (isAvailable) {
        // NIK is available, navigate to DaftarPWPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DaftarPWPage()),
        );
      } else {
        // NIK is already used, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('NIK sudah digunakan atau kosong.')),
        );
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memverifikasi NIK.')),
      );
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
                    ),
                    maxLength: 16,
                  ),
                ),
                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
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
                    maxWidth: 400,
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
                    readOnly: true,
                  ),
                ),
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Captcha',
                    ),
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () async {
                    String nik = nikController.text;
                    
                    try {
                      bool isAvailable = await _checkNIK(nik);
                      if (isAvailable) {
                        // NIK is available, navigate to DaftarPWPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DaftarPWPage()),
                        );
                      } else {
                        // NIK is already used, show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('NIK sudah digunakan atau kosong.')),
                        );
                      }
                    } catch (e) {
                      // Handle error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Gagal memverifikasi NIK.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 40),
                    side: BorderSide(color: Colors.teal, width: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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



  // Future<void> _register(BuildContext context) async {
  //   // Menggunakan provider untuk mendapatkan data pendaftaran
  //   final daftarModel = Provider.of<DaftarModel>(context, listen: false);
  //   String nik = daftarModel.nik;
  //   String nama = daftarModel.nama;
  //   String tglLahir = daftarModel.birthDate;

  //   var url = 'http://127.0.0.1:8000/api/users';
  //   var response = await http.post(
  //     Uri.parse(url),
  //     headers: {
  //       'Content-Type': 'application/json', // Atur header Content-Type sebagai application/json
  //     },
  //     body: jsonEncode({ // Encode data dalam format JSON
  //       'nik': nik,
  //       'nama': nama,
  //       'tgl_lahir': tglLahir,
  //     }),
  //   );

  //   if (response.statusCode == 201) {
  //     // Berhasil mendaftar
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => DaftarPWPage(nik: nik)),
  //     );
  //   } else {
  //     // Gagal mendaftar, menampilkan pesan kesalahan
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Gagal Mendaftar"),
  //           content: Text("Terjadi kesalahan saat mendaftar. Silakan coba lagi."),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text("OK"),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }