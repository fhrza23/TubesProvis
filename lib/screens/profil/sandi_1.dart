// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';
// import 'sandi_2.dart';
// import 'models/sandi_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_application_2/user_profile.dart';
// import 'provider/sandi_provider.dart'; // Assuming you have a PasswordProvider

// class SandiPage extends StatefulWidget {
//   @override
//   _SandiPageState createState() => _SandiPageState();
// }

// class _SandiPageState extends State<SandiPage> {
//   TextEditingController nikController = TextEditingController();
//   TextEditingController noHpController = TextEditingController();
//   TextEditingController otpController = TextEditingController();

//   bool isPhoneNumberEntered = true;
//   bool isOTPVerified = false;

//   String dialogTitle = 'Verifikasi Nomor HP';
//   String dialogContent = 'Silahkan memasukkan nomor handphone dengan benar, karena sistem akan mengirimkan kode verifikasi ke nomor tersebut';
//   String hintText = 'Cth : 0820xxxxxx';
//   String buttonText = 'Kirim Kode Verifikasi';
//   // bool isPhoneNumberEntered = false;
//   // bool isOTPVerified = false;

//   Future<void> sendOtp() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:8000/api/send_otp'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({'no_hp': noHpController.text}),
//     );

//     if (response.statusCode == 200) {
//       print('OTP sent successfully');
//     } else {
//       print('Failed to send OTP');
//     }
//   }

//   Future<void> verifyOtp() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:8000/api/verify_otp'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'no_hp': noHpController.text,
//         'otp': otpController.text
//       }),
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         isOTPVerified = true;
//         dialogContent = 'Verifikasi Nomor HP Berhasil';
//       });
//       // Navigator.pop(context); // Tutup dialog OTP
//       Future.delayed(Duration(seconds: 3), () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => PerbaruiKataSandiPage())
//         );
//         // _PerbaruiKataSandiPage(); // Panggil fungsi untuk mengirim data pendaftaran ke server
//       }
//       );
//     } else {
//       setState(() {
//         isOTPVerified = false;
//         dialogContent = 'Kode OTP salah, silakan coba lagi';
//       });
//     }
//   }

//   void _showOtpDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         bool localIsPhoneNumberEntered = isPhoneNumberEntered;
//         bool localIsOTPVerified = isOTPVerified;
//         String localDialogTitle = isPhoneNumberEntered ? 'Verifikasi OTP' : dialogTitle;
//         String localDialogContent = isPhoneNumberEntered
//             ? (isOTPVerified
//                 ? 'Verifikasi Nomor HP Berhasil'
//                 : 'Masukkan kode verifikasi yang Anda terima pada nomor handphone Anda')
//             : dialogContent;
//         String localHintText = isPhoneNumberEntered ? 'Nomor Verifikasi' : hintText;
//         String localButtonText = buttonText;

//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               contentPadding: EdgeInsets.zero,
//               title: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.teal,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(
//                     localDialogTitle,
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               content: Container(
//                 width: 250,
//                 height: 300,
//                 child: Padding(
//                   padding: const EdgeInsets.all(28.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(localDialogContent, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
//                       SizedBox(height: 20),
//                       if (!localIsOTPVerified) 
//                         TextFormField(
//                           controller: otpController,
//                           decoration: InputDecoration(
//                             labelText: localHintText,
//                           ),
//                         ),
//                       if (!localIsOTPVerified)
//                         SizedBox(height: 20),
//                       if (!localIsOTPVerified)
//                         Center(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 if (localIsPhoneNumberEntered) {
//                                   Center(
//                                     child: Icon(
//                                       Icons.check_circle,
//                                       color: Colors.teal,
//                                       size: 200,
//                                     ),
//                                   );
//                                   verifyOtp();
//                                 } 
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               fixedSize: Size(300, 40), 
//                               side: BorderSide(color: Colors.teal, width: 3),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10)
//                               )
//                             ),
//                             child: Text(localButtonText, style: TextStyle(color: Colors.teal, fontSize: 20)),
//                           ),
//                         ),
//                       if (localIsOTPVerified)
//                         Center(
//                           child: Icon(
//                             Icons.check_circle,
//                             color: Colors.teal,
//                             size: 200,
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _checknikhp() {
//     if (!isPhoneNumberEntered){
//         return;
//     }

//     sendOtp();
//     _showOtpDialog();
//   }

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
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Lupa Kata Sandi',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 60),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400,
//                   ),
//                   child: TextFormField(
//                     controller: nikController,
//                     decoration: InputDecoration(
//                       labelText: 'Nomor Induk Kependudukkan',
//                       suffixIcon: Icon(Icons.assignment_ind),
//                     ),
//                     maxLength: 16,
//                     onChanged: (value) {
//                       setState(() {
//                         isPhoneNumberEntered = value.isNotEmpty;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400,
//                   ),
//                   child: TextFormField(
//                     controller: noHpController,
//                     decoration: InputDecoration(
//                       labelText: 'Nomor Handphone',
//                     ),
//                     onChanged: (value) {
//                       // Capture the phone number
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 100),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (!isPhoneNumberEntered) {
//                       // Show error if phone number is not entered
//                       return;
//                     }
//                     _checknikhp();

//                   },
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: Size(200, 50),
//                     side: BorderSide(color: Colors.teal, width: 3),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text('Lanjut', style: TextStyle(color: Colors.teal, fontSize: 20)),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PerbaruiKataSandiPage extends StatelessWidget {
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
  
//   bool _validatePassword(String password) {
//     final hasMinLength = password.length >= 6;
//     final hasNumber = password.contains(RegExp(r'[0-9]'));
//     final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
//     final hasLowerCase = password.contains(RegExp(r'[a-z]'));
//     return hasMinLength && hasNumber && hasUpperCase && hasLowerCase;
//   }

//   Future<void> _ceksandi() async {
//     final pwModel = Provider.of<PWModel>(context, listen: false);
//     pwModel.setNik(nikController.text);
//     pwModel.setPassword(passwordController.text);

//     final response = await http.post(
//       Uri.parse('http://localhost:8000/api/change-password'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'nik': pwModel.nik,
//         'password': pwModel.password,
//       }),
//     );

//     if (response.statusCode == 201) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => PerbaruiKataSandiPage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Pendaftaran gagal, silakan coba lagi.')),
//       );
//     }
//   }

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
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Lupa Kata Sandi',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 60),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400,
//                   ),
//                   child: TextFormField(
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'Kata Sandi Baru',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400,
//                   ),
//                   child: TextFormField(
//                     obscureText: true,
//                     controller: confirmPasswordController,
//                     decoration: InputDecoration(
//                       labelText: 'Ketik Ulang Kata Sandi Baru',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Text(
//                   'Ketentuan Penulisan Kata Sandi:',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 10),
//                     Text('• Kata sandi terdiri dari setidaknya 6 (enam) karakter'),
//                     Text('• Kata sandi harus mengandung angka/numerik'),
//                     Text('• Kata sandi harus mengandung huruf besar dan kecil'),
//                   ],
//                 ),
//                 SizedBox(height: 100),
//                 ElevatedButton(
//                   onPressed: _ceksandi,//() {
                    
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => SandiConfirmPage())
//                     // );
//                   // },
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: Size(300, 40),
//                     side: BorderSide(color: Colors.teal, width: 3),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     'Perbarui Kata Sandi',
//                     style: TextStyle(color: Colors.teal, fontSize: 20),
//                   ),
//                 ),
//                 SizedBox(height: 20),
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
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_2/provider/token_provider.dart';
import 'package:flutter_application_2/models/sandi_model.dart';
import 'package:flutter_application_2/provider/sandi_provider.dart'; // Assuming you have a PasswordProvider

class SandiPage extends StatefulWidget {
  @override
  _SandiPageState createState() => _SandiPageState();
}

class _SandiPageState extends State<SandiPage> {
  
  TextEditingController nikController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  bool isPhoneNumberEntered = true;
  bool isOTPVerified = false;

  String dialogTitle = 'Verifikasi Nomor HP';
  String dialogContent = 'Silahkan memasukkan nomor handphone dengan benar, karena sistem akan mengirimkan kode verifikasi ke nomor tersebut';
  String hintText = 'Cth : 0820xxxxxx';
  String buttonText = 'Kirim Kode Verifikasi';

  Future<void> sendOtp() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/send_otp'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'no_hp': noHpController.text}),
    );

    if (response.statusCode == 200) {
      print('OTP sent successfully');
    } else {
      print('Failed to send OTP');
    }
  }

  Future<void> verifyOtp() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/verify_otp'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'no_hp': noHpController.text,
        'otp': otpController.text
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        isOTPVerified = true;
        dialogContent = 'Verifikasi Nomor HP Berhasil';
      });
      Future.delayed(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PerbaruiKataSandiPage(nik: nikController.text)),
        );
      });
    } else {
      setState(() {
        isOTPVerified = false;
        dialogContent = 'Kode OTP salah, silakan coba lagi';
      });
    }
  }

  void _showOtpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        bool localIsPhoneNumberEntered = isPhoneNumberEntered;
        bool localIsOTPVerified = isOTPVerified;
        String localDialogTitle = isPhoneNumberEntered ? 'Verifikasi OTP' : dialogTitle;
        String localDialogContent = isPhoneNumberEntered
            ? (isOTPVerified
                ? 'Verifikasi Nomor HP Berhasil'
                : 'Masukkan kode verifikasi yang Anda terima pada nomor handphone Anda')
            : dialogContent;
        String localHintText = isPhoneNumberEntered ? 'Nomor Verifikasi' : hintText;
        String localButtonText = buttonText;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    localDialogTitle,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              content: Container(
                width: 250,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(localDialogContent, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      SizedBox(height: 20),
                      if (!localIsOTPVerified) 
                        TextFormField(
                          controller: otpController,
                          decoration: InputDecoration(
                            labelText: localHintText,
                          ),
                        ),
                      if (!localIsOTPVerified)
                        SizedBox(height: 20),
                      if (!localIsOTPVerified)
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (localIsPhoneNumberEntered) {
                                  Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.teal,
                                      size: 200,
                                    ),
                                  );
                                  verifyOtp();
                                } 
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(300, 40), 
                              side: BorderSide(color: Colors.teal, width: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            child: Text(localButtonText, style: TextStyle(color: Colors.teal, fontSize: 20)),
                          ),
                        ),
                      if (localIsOTPVerified)
                        Center(
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.teal,
                            size: 200,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _checknikhp() {
    if (!isPhoneNumberEntered){
        return;
    }

    sendOtp();
    _showOtpDialog();
  }

  @override
  Widget build(BuildContext context) {
          SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString('token');
      print('Token: $token');
      // Lakukan sesuatu dengan token
  // print('Token before request: $token');
    });
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
                  'Lupa Kata Sandi',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
                      suffixIcon: Icon(Icons.assignment_ind),
                    ),
                    maxLength: 16,
                    onChanged: (value) {
                      setState(() {
                        isPhoneNumberEntered = value.isNotEmpty;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TextFormField(
                    controller: noHpController,
                    decoration: InputDecoration(
                      labelText: 'Nomor Handphone',
                    ),
                    onChanged: (value) {
                      // Capture the phone number
                    },
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    if (!isPhoneNumberEntered) {
                      // Show error if phone number is not entered
                      return;
                    }
                    _checknikhp();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 50),
                    side: BorderSide(color: Colors.teal, width: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Lanjut', style: TextStyle(color: Colors.teal, fontSize: 20)),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PerbaruiKataSandiPage extends StatelessWidget {
  final String nik;

  PerbaruiKataSandiPage({required this.nik});

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  
  bool _validatePassword(String password) {
    final hasMinLength = password.length >= 6;
    final hasNumber = password.contains(RegExp(r'[0-9]'));
    final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = password.contains(RegExp(r'[a-z]'));
    return hasMinLength && hasNumber && hasUpperCase && hasLowerCase;
  }

Future<void> _ceksandi(BuildContext context) async {
  SharedPreferences.getInstance().then((prefs) async {
    String? token = prefs.getString('token');

    // Print the token for debugging purposes (remove in production)
    debugPrint('Token: $token');

final Map<String, dynamic> requestBody = {
  'new_password': passwordController.text, // New field for new password
};

    // Log the request body before sending it
    print('Request body: ${jsonEncode(requestBody)}');

    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/change-password'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Include token in header
      },
      body: json.encode(requestBody),
    );

    // Log the response status code and body
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserProfile()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pembaruan kata sandi gagal, silakan coba lagi.')),
      );
    }
  });
}

  @override
  Widget build(BuildContext context) {
          SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString('token');
      print('Token: $token');
      // Lakukan sesuatu dengan token
  // print('Token before request: $token');
    });
    final tokenProvider = Provider.of<TokenProvider>(context);
    final token = tokenProvider.token;

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
                  'Perbarui Kata Sandi',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi Baru',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Ketik Ulang Kata Sandi Baru',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Ketentuan Penulisan Kata Sandi:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text('• Kata sandi terdiri dari setidaknya 6 (enam) karakter'),
                    Text('• Kata sandi harus mengandung angka/numerik'),
                    Text('• Kata sandi harus mengandung huruf besar dan kecil'),
                  ],
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    if (passwordController.text != confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Kata sandi tidak cocok.')),
                      );
                      return;
                    }
                    if (!_validatePassword(passwordController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Kata sandi tidak memenuhi syarat.')),
                      );
                      return;
                    }
                    _ceksandi(context);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 40),
                    side: BorderSide(color: Colors.teal, width: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Perbarui Kata Sandi',
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
