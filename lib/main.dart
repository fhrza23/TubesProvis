import 'package:flutter/material.dart';
import 'kontentengah.dart';
// import 'pembayaran_nontunai.dart';

import 'dart:convert';

void main() => runApp(MyApp());
  // gatau();}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            konten(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}