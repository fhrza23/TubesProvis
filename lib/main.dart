import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/user_service.dart';
import 'models/daftar_model.dart';
import 'models/login_model.dart';
import 'provider/dokter_provider.dart';
import 'kontentengah.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DokterProvider()),
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (context) => DaftarModel()),
        Provider(create: (_) => UserService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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


