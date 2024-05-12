import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Key? key;
  final String title;
  final String content;
  final String hintText;
  final String buttonText;
  final bool isPhoneNumberEntered;
  final bool isOTPVerified;
  final Function(bool) onPressed;

  const CustomAlertDialog({
    this.key,
    required this.title,
    required this.content,
    required this.hintText,
    required this.buttonText,
    required this.isPhoneNumberEntered,
    required this.isOTPVerified,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isPhoneNumberEntered ? 'Verifikasi OTP' : title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isPhoneNumberEntered
                ? (isOTPVerified
                    ? 'Verifikasi Nomor HP Berhasil'
                    : 'Masukkan kode verifikasi yang Anda terima pada nomor handphone Anda')
                : content,
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: isPhoneNumberEntered ? 'Nomor Verifikasi' : hintText,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onPressed(isPhoneNumberEntered);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DaftarPWPage()),
              // );
            },
            child: Text(buttonText),
          ),
        ],
      ),
      actions: [
        if (isOTPVerified)
          Icon(
            Icons.check_circle,
            color: Colors.teal,
            size: 70,
          ),
      ],
    );
  }
}
