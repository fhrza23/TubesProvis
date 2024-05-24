// import 'package:flutter/material.dart';
// import 'kontentengah.dart';
// // import 'pembayaran_nontunai.dart';

// import 'dart:convert';

// void main() => runApp(MyApp());
//   // gatau();}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
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
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 5),
//             konten(),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'service/user_service.dart';
import 'model/daftar_model.dart';
import 'model/login_model.dart';
import 'daftar_1.dart';
import 'kontentengah.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (_) => DaftarModel()),
        ChangeNotifierProvider(create: (_) => DokterProvider()),
        Provider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        title: 'Rawatjalan.id',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomeScreen(),
      ),
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


