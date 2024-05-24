// import 'package:flutter/material.dart';
// // import 'popup.dart';
// import 'daftar_3.dart';

// class DaftarPWPage extends StatefulWidget {
//   // final String nik;

//   // DaftarPWPage({required this.nik});

//   @override
//   _DaftarPWPageState createState() => _DaftarPWPageState();
// }

// class _DaftarPWPageState extends State<DaftarPWPage> {
//   TextEditingController noHpController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();

//   bool isPhoneNumberEntered = false;
//   bool isOTPVerified = false;

//   String dialogTitle = 'Verifikasi Nomor HP';
//   String dialogContent = 'Silahkan memasukkan nomor handphone dengan benar, karena sistem akan mengirimkan kode verifikasi ke nomor tersebut';
//   String hintText = 'Cth : 0820xxxxxx';
//   String buttonText = 'Kirim Kode Verifikasi';
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
//                     maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
//                   ),
//                   child: TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Kata Sandi',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
//                   ),
//                   child: TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Konfirmasi Kata Sandi',
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Text(
//                   'Ketentuan Penulisan Kata Sandi:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 300, // Ganti dengan lebar maksimum yang sesuai
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center, // Menengahkan vertikal
//                     crossAxisAlignment: CrossAxisAlignment.start, // Membuat teks berada di kiri
//                     children: [
//                       SizedBox(height: 10),
//                       Text('• Kata sandi terdiri dari setidaknya 6 (enam) karakter'),
//                       Text('• Kata sandi harus mengandung angka/numerik'),
//                       Text('• Kata sandi harus mengandung huruf besar dan kecil'),
//                       SizedBox(height: 20),
//                       Text(
//                         'Dengan melakukan pendaftaran, Anda telah menyetujui kebijakan privasi aplikasi Rawatjalan.id',
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 100),
//                 ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         bool localIsPhoneNumberEntered = isPhoneNumberEntered;
//                         bool localIsOTPVerified = isOTPVerified;
//                         String localDialogTitle = isPhoneNumberEntered ? 'Verifikasi OTP' : dialogTitle;
//                         String localDialogContent = isPhoneNumberEntered
//                             ? (isOTPVerified
//                                 ? 'Verifikasi Nomor HP Berhasil'
//                                 : 'Masukkan kode verifikasi yang Anda terima pada nomor handphone Anda')
//                             : dialogContent;
//                         String localHintText = isPhoneNumberEntered ? 'Nomor Verifikasi' : hintText;
//                         String localButtonText = buttonText;

//                         return StatefulBuilder(
//                           builder: (context, setState) {
//                             return AlertDialog(
//                               contentPadding: EdgeInsets.zero, // Set contentPadding ke nol
//                               title: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.teal,
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(20.0),
//                                   child: Text(
//                                     localDialogTitle,
//                                     style: TextStyle(
//                                       color: Colors.white, // Warna teks untuk title
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ),
//                               content: Container(
//                                 width: 250, // Lebar yang diinginkan
//                                 height: 300, // Tinggi yang diinginkan
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(28.0),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Text(localDialogContent,style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
//                                       SizedBox(height: 20),
//                                       if (!localIsOTPVerified) (
//                                         TextFormField(
//                                           decoration: InputDecoration(
//                                             labelText: localHintText,
//                                           ),
//                                         )
//                                       ),
//                                       if (!localIsOTPVerified)
//                                       SizedBox(height: 20),
//                                       if (!localIsOTPVerified)
//                                       Center(
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               if (localIsPhoneNumberEntered) {
//                                                 // Tambahkan logika untuk memeriksa kode OTP
//                                                 // Di sini saya hanya simulasi, Anda perlu menggantinya
//                                                 localIsOTPVerified = true;
//                                                 localDialogContent = 'Verifikasi Nomor HP Berhasil';
                                                    
//                                                 // Simulasi penundaan navigasi selama 3 detik
//                                                 Future.delayed(Duration(seconds: 2), () {
//                                                   Navigator.pushReplacement(
//                                                     context,
//                                                     MaterialPageRoute(builder: (context) => DaftarConfirmPage()),
//                                                   );
//                                                 });
//                                               } else {
//                                                 localDialogTitle = 'Verifikasi OTP';
//                                                 localDialogContent = 'Masukkan kode verifikasi yang Anda terima pada nomor handphone Anda';
//                                                 localHintText = 'Nomor Verifikasi';
//                                                 localButtonText = 'Verifikasi';
//                                                 localIsPhoneNumberEntered = true;
//                                               }
//                                             });
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             fixedSize: Size(300, 40), 
//                                             side: BorderSide(color: Colors.teal, width: 3),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.circular(10)
//                                             )
//                                           ),
//                                           child: Text(localButtonText,style: TextStyle(color: Colors.teal, fontSize: 20)),
//                                         ),
//                                       ),
//                                 if (localIsOTPVerified)
//                                   Center(
//                                     child: Icon(
//                                       Icons.check_circle,
//                                       color: Colors.teal,
//                                       size: 200,
//                                     ),
//                                   ),
//                                     ],
//                                   ),
//                                 ),
//                               // actions: [
//                               // ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     );
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => DaftarConfirmPage()),
//                     // );
//                   },
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(200, 40), 
//                   side: BorderSide(color: Colors.teal, width: 3),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   )
//                 ),
//                 child: Text('Daftar Akun',style: TextStyle(color: Colors.teal, fontSize: 20)),
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
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'daftar_3.dart';

class DaftarPWPage extends StatefulWidget {
  @override
  _DaftarPWPageState createState() => _DaftarPWPageState();
}

class _DaftarPWPageState extends State<DaftarPWPage> {
  TextEditingController noHpController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPhoneNumberEntered = false;
  bool isOTPVerified = false;

  String dialogTitle = 'Verifikasi Nomor HP';
  String dialogContent = 'Silahkan memasukkan nomor handphone dengan benar, karena sistem akan mengirimkan kode verifikasi ke nomor tersebut';
  String hintText = 'Cth : 0820xxxxxx';
  String buttonText = 'Kirim Kode Verifikasi';

  bool _validatePassword(String password) {
    final hasMinLength = password.length >= 6;
    final hasNumber = password.contains(RegExp(r'[0-9]'));
    final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = password.contains(RegExp(r'[a-z]'));
    return hasMinLength && hasNumber && hasUpperCase && hasLowerCase;
  }

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
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DaftarConfirmPage()),
        );
      });
    } else {
      setState(() {
        isOTPVerified = false;
        dialogContent = 'Kode OTP salah, silakan coba lagi';
      });
    }
  }

  void _register() {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (!_validatePassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kata sandi tidak memenuhi kriteria.')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kata sandi dan konfirmasi kata sandi tidak cocok.')),
      );
      return;
    }

    // Jika validasi berhasil, lanjutkan dengan logika pendaftaran
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
                      if (!localIsOTPVerified) (
                        TextFormField(
                          controller: otpController,
                          decoration: InputDecoration(
                            labelText: localHintText,
                          ),
                        )
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
                              } else {
                                localDialogTitle = 'Verifikasi OTP';
                                localDialogContent = 'Masukkan kode verifikasi yang Anda terima pada nomor handphone Anda';
                                localHintText = 'Nomor Verifikasi';
                                localButtonText = 'Verifikasi';
                                localIsPhoneNumberEntered = true;
                                sendOtp();
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
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400, // Atur lebar maksimum sesuai kebutuhan
                  ),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Konfirmasi Kata Sandi',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Ketentuan Penulisan Kata Sandi:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 300, // Ganti dengan lebar maksimum yang sesuai
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Menengahkan vertikal
                    crossAxisAlignment: CrossAxisAlignment.start, // Membuat teks berada di kiri
                    children: [
                      SizedBox(height: 10),
                      Text('• Kata sandi terdiri dari setidaknya 6 (enam) karakter'),
Text('• Kata sandi harus mengandung angka/numerik'),
Text('• Kata sandi harus mengandung huruf besar dan kecil'),
SizedBox(height: 20),
Text(
'Dengan melakukan pendaftaran, Anda telah menyetujui kebijakan privasi aplikasi Rawatjalan.id',
textAlign: TextAlign.center,
),
],
),
),
SizedBox(height: 100),
ElevatedButton(
onPressed: _register,
style: ElevatedButton.styleFrom(
fixedSize: Size(200, 40),
side: BorderSide(color: Colors.teal, width: 3),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10)
)
),
child: Text('Daftar Akun', style: TextStyle(color: Colors.teal, fontSize: 20)),
),
],
),
),
),
),
);
}
}
