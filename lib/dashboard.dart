import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'jadwal_dokter.dart';
import 'doctor_list.dart';
import 'user_profile.dart';
import 'rekam_medis_1.dart';
import 'artikel_1.dart';
import 'pendaftaraan.dart';
import 'semua_notifikasi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// void main() {
//   runApp(const MyApp());
// }

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(title: 'Dashboard'),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rawatjalan.id',
          style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
        ),
        backgroundColor: const Color.fromRGBO(35, 136, 120, 1),
        actions: [
          CustomPopup(
            content: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(35, 136, 120, 1),
                      ),
                      child: Icon(Icons.notifications_active, color: Colors.white),
                    ),
                    title: Text('Reminder!', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('5 Antrian lagi menuju antrianmu!'),
                        Text(
                          'Sekarang',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    // trailing: Icon(Icons.keyboard_arrow_down),
                    // onTap: () {
                    //   // Tambahkan logika jika Anda ingin melakukan sesuatu ketika item diklik
                    // },
                  ),
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(35, 136, 120, 1),
                      ),
                      child: Icon(Icons.newspaper, color: Colors.white),
                    ),
                    title: Text('Rumah Sakit Sentra Medika Resmi dibuka!', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Baca Artikel Sekarang!'),
                        Text(
                          '5 Menit yang lalu',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    // trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: () {
                      // Tambahkan logika jika Anda ingin melakukan sesuatu ketika item diklik
                      
                    },
                  ),
                  // Tambahkan menu dan subjudul lainnya sesuai kebutuhan
                  Divider(),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk menangani aksi saat tombol submit ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationListPage()),
                      );
                    },
                    child: Text('Lihat Semua', style: TextStyle(color: Color.fromRGBO(35, 136, 120, 1)) ,),
                  ),
                ],
              ),
            ),
            child: const Icon(color: Colors.white, Icons.notifications),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          
          SizedBox(height: 20.0),
          // Widget CarouselSlider dan DotsIndicator
          CustomCarousel(),
          // Widget Tombol 2x3
          SizedBox(height: 20.0), // Jarak antara Carousel dan ButtonGrid (40.0
          ButtonGrid(context: context),
          SizedBox(height: 20.0), // Jarak antara Carousel dan ButtonGrid (40.0
          // Widget Informasi Kontak
          FooterWidget(),
        ],
      ),
    );
  }
}

class CustomCarousel extends StatefulWidget {
  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  @override
  Widget buildCarouselItem(String imagePath, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blue,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Gambar artikel dengan sudut atas yang dibulatkan
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          // Judul artikel dengan sudut bawah yang dibulatkan
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Color.fromRGBO(35, 136, 120, 1),
      child: Column(
        children: [
          SizedBox(height: 20.0),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: [
              buildCarouselItem('images/rs.png', 'Rumah Sakit Sentra Medika Resmi Dibuka!'),
              buildCarouselItem('images/ai.jpg', 'Peranan AI dalam Diagnostik Medis'),
              buildCarouselItem('images/igd.jpg', 'Peresmian IGD Rumah Sakit Sentra Medika'),
            ],
          ),
          SizedBox(height: 8.0),
          DotsIndicator(
            dotsCount: 3,
            position: _currentIndex.toDouble(),
            decorator: DotsDecorator(
              activeColor: Colors.blue,
              spacing: const EdgeInsets.all(2.0),
              activeSize: const Size(80.0, 8.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonGrid extends StatelessWidget {
  final BuildContext context;

  ButtonGrid({required this.context});
  // Fungsi untuk membuat tombol dengan ikon dan teks tertentu
  Widget buildButton(IconData icon, String label, Widget destination) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(35, 136, 120, 1),
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Icon(icon, color: Colors.white),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(Icons.calendar_month, 'Cek Jadwal\nDokter', JadwalDokter()),
                  SizedBox(width: 20),
                  buildButton(Icons.line_weight_sharp, 'List\nDokter', DoctorList()),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(Icons.paste, 'Daftar\nSekarang', AppointmentRegistrationPage()),
                  SizedBox(width: 20),
                  buildButton(Icons.access_time, 'Rekam\nMedis', RekamMedis()),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(Icons.queue, 'Status\nAntrean', JadwalDokter()),
                  SizedBox(width: 20),
                  buildButton(Icons.newspaper, 'Artikel &\nBerita', Artikel()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      color: Color.fromRGBO(35, 136, 120, 1),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.white),
                SizedBox(width: 8),
                Text("Jalan Rumah Sehat No 01",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.email, color: Colors.white),
                SizedBox(width: 8),
                Text("rawatjalan@gmail.com",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.call, color: Colors.white),
                SizedBox(width: 8),
                Text("021-123456789",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String nik;
  final String nama;
  final String noHp;
  final String password;
  final String tglLahir;

  User({
    required this.id,
    required this.nik,
    required this.nama,
    required this.noHp,
    required this.password,
    required this.tglLahir,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nik: json['nik'],
      nama: json['nama'],
      noHp: json['no_hp'],
      password: json['password'],
      tglLahir: json['tgl_lahir'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late List<User> _users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/users'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        _users = responseData.map((json) => User.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: _users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  title: Text(user.nama),
                  subtitle: Text(user.nik),
                );
              },
            ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Dashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Rawatjalan.id',
//           style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
//         ),
//         backgroundColor: const Color.fromRGBO(35, 136, 120, 1),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.person),
//             color: Colors.white,
//             onPressed: () {
//               // Navigasi ke halaman profil pengguna
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UserProfile()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           SizedBox(height: 20.0),
//           // Tambahkan widget lainnya di sini
//           // Contoh: CustomCarousel(),
//           //        ButtonGrid(context: context),
//           //        FooterWidget(),
//           //        dsb...
//           ElevatedButton(
//             onPressed: () {
//               // Navigasi ke halaman daftar pengguna
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UserListScreen()),
//               );
//             },
//             child: Text('Lihat Daftar Pengguna'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class User {
//   final int id;
//   final String nik;
//   final String nama;
//   final String password;
//   final String no_hp;
//   final String tgl_lahir;

//   User({
//     required this.id,
//     required this.nik,
//     required this.nama,
//     required this.password,
//     required this.no_hp,
//     required this.tgl_lahir,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       nik: json['nik'],
//       nama: json['nama'],
//       password: json['password'],
//       no_hp: json['no_hp'],
//       tgl_lahir: json['tgl_lahir'],
//     );
//   }
// }

// class UserListScreen extends StatefulWidget {
//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }

// class _UserListScreenState extends State<UserListScreen> {
//   late List<User> _users = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }
// Future<void> fetchUsers() async {
//   final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/users'));

//   if (response.statusCode == 200) {
//     final List<dynamic> usersData = json.decode(response.body);

//     // Bersihkan daftar pengguna sebelum menambahkan data baru
//     _users.clear();

//     for (var userData in usersData) {
//       try {
//         // Periksa apakah userData adalah List<dynamic> dengan panjang yang sesuai
//         if (userData is List<dynamic> && userData.length == 6) {
//           // Gunakan indeks untuk mengakses properti data pengguna
//           _users.add(User(
//             id: userData[0],
//             nik: userData[1],
//             nama: userData[2],
//             no_hp: userData[3],
//             password: userData[4],
//             tgl_lahir: userData[5],
//           ));
//         } else {
//           // Jika userData tidak sesuai dengan format yang diharapkan, lewati
//           print('Invalid user data format: $userData');
//         }
//       } catch (e) {
//         // Tangani kesalahan jika terjadi
//         print('Error parsing user data: $e');
//       }
//     }

//     // Setelah semua pengguna ditambahkan, panggil setState untuk memperbarui tampilan
//     setState(() {});
//   } else {
//     throw Exception('Failed to load users');
//   }
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User List'),
//       ),
//       body: _users.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _users.length,
//               itemBuilder: (context, index) {
//                 final user = _users[index];
//                 return ListTile(
//                   title: Text(user.nama),
//                   subtitle: Text(user.nik),
//                 );
//               },
//             ),
//     );
//   }
// }

// class UserProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Center(
//         child: Text('Ini adalah halaman profil pengguna'),
//       ),
//     );
//   }
// }
