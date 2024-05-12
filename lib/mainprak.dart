import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarWithIconAndText(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft, // Teks diatur ke kiri atas
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ini Adalah Halaman Dashboard',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 20), // Tambahkan jarak sebelum ListView
                  Container(
                    height: 50, // Tinggi container
                    child: ListView(
                      scrollDirection: Axis.horizontal, // List view ke samping
                      children: [
                        // Gunakan method buildButton untuk membuat tombol
                        buildButton('Button 1', Icons.add),
                        SizedBox(width: 10), // Jarak antara tombol
                        buildButton('Button 2', Icons.delete),
                        SizedBox(width: 10), // Jarak antara tombol
                        buildButton('Button 3', Icons.edit),
                        // Tambahkan lebih banyak tombol di sini jika perlu
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Popular',
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    height: 50, // Tinggi container
                    child: ListView(
                      scrollDirection: Axis.horizontal, // List view ke samping
                      children: [
                        // Gunakan method buildButton untuk membuat tombol
                        buildButton('Button 1', Icons.add),
                        SizedBox(width: 10), // Jarak antara tombol
                        buildButton('Button 2', Icons.delete),
                        SizedBox(width: 10), // Jarak antara tombol
                        buildButton('Button 3', Icons.edit),
                        // Tambahkan lebih banyak tombol di sini jika perlu
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk menangani saat item bottom navigation bar ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class AppBarWithIconAndText extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.people_alt_outlined),
        color: Colors.white,
        onPressed: () {
          // Aksi yang dijalankan saat ikon ditekan
        },
      ),
      backgroundColor: Colors.lightBlue[700],
      title: Text(
        'Dashboard',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// Method untuk membuat tombol dengan ikon dan teks yang ditentukan pengguna
Widget buildButton(String buttonText, IconData icon) {
  return ElevatedButton.icon(
    onPressed: () {
      // Aksi yang akan dijalankan saat tombol ditekan
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.yellow[800], // Warna latar belakang kuning
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Bentuk kotak yang agak tumpul
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Padding tombol
    ),
    icon: Icon(icon), // Icon di sebelah kiri teks
    label: Text(buttonText), // Teks di tengah tombol
  );
}
