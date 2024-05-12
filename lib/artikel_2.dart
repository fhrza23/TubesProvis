import 'package:flutter/material.dart';
import 'artikel_1.dart';

class BeritaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 112, 99), // Ubah warna latar belakang appbar menjadi hijau
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Ikon back dengan warna putih
          onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Artikel()), // Ganti dengan halaman yang sesuai
                );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white), // Ikon lonceng dengan warna putih
            onPressed: () {
              // Fungsi yang akan dijalankan ketika tombol lonceng ditekan
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white), // Ikon profil dengan warna putih
            onPressed: () {
              // Fungsi yang akan dijalankan ketika tombol profil ditekan
            },
          ),
        ],
      ),
      body: Column(
  children: [
    Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
                children: [
                  Container(
                    width: 330,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('images/rumahsakit.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white, // Ubah warna latar belakang teks dan atur opasitas
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'Rumah Sakit Sentra Medika\nResmi Dibuka',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 350,
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              'Seorang pasien keluar dari rumah sakit setelah berhari-hari perawatan intensif. Dia berjalan dengan gagah, tersenyum lebar, dan bersorak, "Akhirnya, saya sembuh sepenuhnya!"\n\nSeorang teman datang menjumpainya di pintu keluar dan bertanya, "Hei, bagaimana perasaanmu setelah sembuh?"\n\nPasien menjawab dengan antusias, "Luar biasa! Rumah sakit ini memang luar biasa. Saya datang ke sini dengan satu kaki di kuburan, dan sekarang, mereka benar-benar menyembuhkan kaki saya!"\nTemannya melongo sejenak dan berkata, "Eh, saya kira Anda mengalami masalah pada kaki Anda?"\n\nPasien dengan riang menjawab, "Oh tidak, tidak sama sekali. Tapi setelah menghabiskan beberapa hari di sini, saya bisa mengatakan bahwa mereka benar-benar menyembuhkan kaki saya dari kebiasaan buruk terus-menerus melangkah ke kuburan!"',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    ),
  ],
),

      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0), // Menyesuaikan tinggi yang diinginkan
        child: SizedBox(
          height: 130.0, // Atur ketinggian menggunakan SizedBox
          child: BottomAppBar(
            color: Color.fromARGB(255, 0, 112, 99), // Ubah warna latar belakang appbar menjadi hijau
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Jalan Rumah Sehat Nomor 01',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat', // Mengatur font family menjadi Montserrat
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'rawatjalan@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat', // Mengatur font family menjadi Montserrat
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        '021-12345678',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat', // Mengatur font family menjadi Montserrat
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
