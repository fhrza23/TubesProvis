import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_popup/flutter_popup.dart';
import '../../jadwal_dokter.dart';
import '../../doctor_list.dart';
import '../../user_profile.dart';
import '../../rekam_medis_1.dart';
import '../artikel/artikel_1.dart';
import '../../pendaftaraan.dart';
import 'semua_notifikasi.dart';
import '../../services/api_service.dart';
import '../../models/notif.dart';
import 'package:intl/intl.dart';

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
  late Future<List<Notifikasi>> futureNotifications;

  @override
  void initState() {
    super.initState();
    futureNotifications = ApiService().fetchNotifications();
  }

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
            content: FutureBuilder<List<Notifikasi>>(
              future: futureNotifications,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No notifications found"));
                } else {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int index = 0; index < snapshot.data!.length && index < 5; index++)
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(35, 136, 120, 1),
                              ),
                              child: Icon(
                                snapshot.data![index].tipeNotif == 1
                                    ? Icons.notifications_active
                                    : Icons.newspaper,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(snapshot.data![index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].subtitle),
                                Text(
                                  formatNotificationTime(snapshot.data![index].time),
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Handle notification tap
                            },
                          ),
                        if (snapshot.data!.length > 5)
                        Divider(),
                        if (snapshot.data!.length > 5)
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
                  );
                  
                }
              },
            ),
            child: const Icon(color: Colors.white, Icons.notifications)
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

  String formatNotificationTime(String timeString) {
    DateTime time = DateTime.parse(timeString);
    Duration difference = DateTime.now().difference(time);

    if (difference.inDays > 0) {
      return DateFormat.yMMMd().format(time); // Tampilkan tanggal jika lebih dari 1 hari yang lalu
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} menit yang lalu';
    } else {
      return 'Baru saja';
    }
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
                  buildButton(Icons.newspaper, 'Artikel &\nBerita', ArtikelPage()),
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
