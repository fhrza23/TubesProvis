import 'package:flutter/material.dart';
import 'sandi_2.dart';

class SandiPage extends StatefulWidget {
  @override
  _SandiPageState createState() => _SandiPageState();
}

class _SandiPageState extends State<SandiPage> {
  String dialogTitle = 'Verifikasi Nomor HP';
  String dialogContent = 'Silahkan memasukkan nomor handphone dengan benar, karena sistem akan mengirimkan kode verifikasi ke nomor tersebut';
  String hintText = 'Cth : 0820xxxxxx';
  String buttonText = 'Kirim Kode Verifikasi';
  bool isPhoneNumberEntered = false;
  bool isOTPVerified = false;

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
                    decoration: InputDecoration(
                      labelText: 'Captcha',
                    ),
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk memeriksa data
                    // dan menampilkan pop up jika benar
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
                              contentPadding: EdgeInsets.zero, // Set contentPadding ke nol
                              title: Container(
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  // border: BorderRadius(cir)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    localDialogTitle,
                                    style: TextStyle(
                                      color: Colors.white, // Warna teks untuk title
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              content: Container(
                                width: 250, // Lebar yang diinginkan
                                height: 300, // Tinggi yang diinginkan
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(localDialogContent,style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                      SizedBox(height: 20),
                                      if (!localIsOTPVerified) (
                                        TextFormField(
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
                                                // Tambahkan logika untuk memeriksa kode OTP
                                                // Di sini saya hanya simulasi, Anda perlu menggantinya
                                                localIsOTPVerified = true;
                                                localDialogContent = 'Verifikasi Nomor HP Berhasil';
                                                    
                                                // Simulasi penundaan navigasi selama 3 detik
                                                Future.delayed(Duration(seconds: 3), () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => PerbaruiKataSandiPage()),
                                                  );
                                                });
                                              } else {
                                                localDialogTitle = 'Verifikasi OTP';
                                                localDialogContent = 'Masukkan kode verifikasi yang Anda terima pada nomor handphone Anda';
                                                localHintText = 'Nomor Verifikasi';
                                                localButtonText = 'Verifikasi';
                                                localIsPhoneNumberEntered = true;
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
                                          child: Text(localButtonText,style: TextStyle(color: Colors.teal, fontSize: 20)),
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
                              // actions: [
                              // ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 50),
                    side: BorderSide(color: Colors.teal, width: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Lanjut',
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

class PerbaruiKataSandiPage extends StatelessWidget {
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
                    obscureText: true,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SandiConfirmPage())
                    );
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