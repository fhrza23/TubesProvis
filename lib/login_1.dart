// import 'package:flutter/material.dart';
// import 'dashboard.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController nikController = TextEditingController();
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
//                   'Masuk ke Akun Anda',
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
//                     maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
//                   ),
//                   child: TextFormField(
//                     controller: nikController, // Menetapkan controller untuk NIK
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
//                     controller: passwordController, // Menetapkan controller untuk password
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Kata Sandi',
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.visibility),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 100),
//                 ElevatedButton(
//                 onPressed: () async {
//                   String nik = nikController.text;
//                   String password = passwordController.text;

//                   var url = 'http://127.0.0.1:8000/api/login';

//                   var response = await http.post(
//                     Uri.parse(url),
//                     headers: {
//                       'Content-Type': 'application/json', // Atur header Content-Type sebagai application/json
//                     },
//                     body: jsonEncode({ // Encode data dalam format JSON
//                       'nik': nik,
//                       'password': password,
//                     }),
//                   );

//                   if (response.statusCode == 200) {
//                     // Berhasil login
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Dashboard()),
//                     );
//                   } else if (response.statusCode == 401) {
//                     // Gagal login, menampilkan pesan kesalahan
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text("Gagal Masuk"),
//                           content: Text("NIK atau kata sandi salah. Silakan coba lagi."),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text("OK"),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   } else {
//                     // Menangani error lain seperti HTTP 500
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text("Error"),
//                           content: Text("Terjadi kesalahan pada server. Silakan coba lagi nanti."),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text("OK"),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(200, 50), 
//                   side: BorderSide(color: Colors.teal, width: 3),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   )
//                 ),
//                 child: Text('Masuk', style: TextStyle(color: Colors.teal, fontSize: 20)),
//               ),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SandiPage()), // Ganti ForgotPasswordPage dengan nama halaman yang sesuai
//                   );
//                 },
//                 child: Text(
//                   'Lupa Kata Sandi?',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     decoration: TextDecoration.underline,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/model/login_model.dart';
import 'package:flutter_application_2/dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'sandi_1.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context, listen: false);

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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                TextField(
                  onChanged: (value) => loginModel.updateNik(value),
                  decoration: InputDecoration(
                    labelText: 'Nomor Induk Kependudukkan',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) => loginModel.updatePassword(value),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () async {
                    final loginModel = Provider.of<LoginModel>(context, listen: false);
                    String nik = loginModel.nik; // Use value from loginModel
                    String password = loginModel.password; // Use value from loginModel

                    var url = 'http://127.0.0.1:8000/api/login';

                    var response = await http.post(
                      Uri.parse(url),
                      headers: {
                        'Content-Type': 'application/json',
                      },
                      body: jsonEncode({
                        'nik': nik,
                        'password': password,
                      }),
                    );

                    if (response.statusCode == 200) {
                      // Berhasil login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    } else if (response.statusCode == 401) {
                      // Gagal login, menampilkan pesan kesalahan
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Gagal Masuk"),
                            content: Text("NIK atau kata sandi salah. Silakan coba lagi."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Menangani error lain seperti HTTP 500
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Terjadi kesalahan pada server. Silakan coba lagi nanti."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  // child: Text('Masuk'),
                  style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50), 
                  side: BorderSide(color: Colors.teal, width: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: Text('Masuk', style: TextStyle(color: Colors.teal, fontSize: 20)),
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
