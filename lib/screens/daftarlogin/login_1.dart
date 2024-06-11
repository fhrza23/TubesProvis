// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_application_2/models/login_model.dart';
// import 'screens/dashboard/dashboard.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'screens/profil/sandi_1.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController nikController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final loginModel = Provider.of<LoginModel>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//                 leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
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
//               crossAxisAlignment: CrossAxisAlignment.center,
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
//                 TextField(
//                   controller: nikController,
//                   onChanged: (value) => loginModel.updateNik(value),
//                   decoration: InputDecoration(
//                     labelText: 'Nomor Induk Kependudukkan',
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   controller: passwordController,
//                   onChanged: (value) => loginModel.updatePassword(value),
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Kata Sandi',
//                   ),
//                 ),
//                 SizedBox(height: 100),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final loginModel = Provider.of<LoginModel>(context, listen: false);
//                     String nik = loginModel.nik; // Use value from loginModel
//                     String password = loginModel.password; // Use value from loginModel

//                     var url = 'http://127.0.0.1:8000/api/login';

//                     var response = await http.post(
//                       Uri.parse(url),
//                       headers: {
//                         'Content-Type': 'application/json; charset=UTF-8',
//                       },
//                       body: jsonEncode({
//                         'nik': nik,
//                         'password': password,
//                       }),
//                     );

//                     print("Response status code: ${response.statusCode}");
//                     print("Response body: ${response.body}");

//                     if (response.statusCode == 200) {
//                         final token = jsonDecode(response.body)['access_token'];
//                         print("Access token: $token");
//                         SharedPreferences.getInstance().then((prefs) {
//                           prefs.setString('token', token);
//                         });

//                         // Berhasil login
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Dashboard()),
//                         );
//                     } else if (response.statusCode == 401) {
//                       // Gagal login, menampilkan pesan kesalahan
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text("Gagal Masuk"),
//                             content: Text("NIK atau kata sandi salah. Silakan coba lagi."),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text("OK"),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     } else {
//                       // Menangani error lain seperti HTTP 500
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text("Error"),
//                             content: Text("Terjadi kesalahan pada server. Silakan coba lagi nanti."),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text("OK"),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     }
//                   },
//                   // child: Text('Masuk'),
//                   style: ElevatedButton.styleFrom(
//                   fixedSize: Size(200, 50), 
//                   side: BorderSide(color: Colors.teal, width: 3),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   )
//                 ),
//                 child: Text('Masuk', style: TextStyle(color: Colors.teal, fontSize: 20)),
//                 ),
//                 SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SandiPage()), // Ganti ForgotPasswordPage dengan nama halaman yang sesuai
//                     );
//                   },
//                   child: Text(
//                     'Lupa Kata Sandi?',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       decoration: TextDecoration.underline,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
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
// import '../models/login_model.dart';
import '../../../provider/login_provider.dart';
import '../dashboard/dashboard.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
import '../profil/sandi_1.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

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
                  controller: nikController,
                  decoration: InputDecoration(
                    labelText: 'Nomor Induk Kependudukkan',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () async {
                    final nik = nikController.text;
                    final password = passwordController.text;
                    await loginProvider.loginUser(nik, password, context);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      side: BorderSide(color: Colors.teal, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text('Masuk', style: TextStyle(color: Colors.teal, fontSize: 20)),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SandiPage()),
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
