import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'artikel_2.dart';
import '../../models/artikel.dart';

class ArtikelPage extends StatefulWidget {
  @override
  _ArtikelPageState createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  late List<Artikel> _Artikels = [];

  @override
  void initState() {
    super.initState();
    fetchArtikels();
  }

  Future<void> fetchArtikels() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/artikel'));

    if (response.statusCode == 200) {
      final List<dynamic> ArtikelsData = json.decode(response.body);

      _Artikels.clear();

      for (var ArtikelData in ArtikelsData) {
        try {
          if (ArtikelData is List<dynamic> && ArtikelData.length == 5) {
            _Artikels.add(Artikel(
              id: ArtikelData[0],
              judul: ArtikelData[1],
              tanggal: ArtikelData[2],
              isi: ArtikelData[3],
              foto: ArtikelData[4],
            ));
          } else {
            print('Invalid Artikel data format: $ArtikelData');
          }
        } catch (e) {
          print('Error parsing Artikel data: $e');
        }
      }

      setState(() {});
    } else {
      throw Exception('Failed to load Artikels');
    }
  }

Future<void> fetchArtikelById(int id) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/artikel/$id'));

    if (response.statusCode == 200) {
      final ArtikelData = json.decode(response.body);

      try {
        if (ArtikelData is List<dynamic> && ArtikelData.length == 5) {
          Artikel artikel = Artikel(
            id: ArtikelData[0],
            judul: ArtikelData[1],
            tanggal: ArtikelData[2],
            isi: ArtikelData[3],
            foto: ArtikelData[4],
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArtikelDetailPage(artikel: artikel)),
          );
        } else {
          print('Invalid Artikel data format: $ArtikelData');
        }
      } catch (e) {
        print('Error parsing Artikel data: $e');
      }
    } else {
      throw Exception('Failed to load Artikel by ID');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 136, 120, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Fungsi yang akan dijalankan ketika tombol profil ditekan
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Artikel',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Divider(color: Colors.grey, indent: 20, endIndent: 20),
          SizedBox(height: 5),
          _Artikels.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: _Artikels.length,
                    itemBuilder: (context, index) {
                      final Artikel = _Artikels[index];
                      return InkWell(
                        onTap: () {
                          // Ketika artikel diklik, ambil detail artikel berdasarkan ID
                          fetchArtikelById(Artikel.id);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      Artikel.foto,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      Artikel.judul,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      Artikel.tanggal,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
              bottomNavigationBar: PreferredSize(
              preferredSize: Size.fromHeight(130.0),
              child: SizedBox(
                height: 130.0,
                child: BottomAppBar(
                  color: Color.fromRGBO(35, 136, 120, 1),
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
                                fontFamily: 'Montserrat',
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
                                fontFamily: 'Montserrat',
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
                                fontFamily: 'Montserrat',
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

class ArtikelListScreen extends StatelessWidget {
  final List<Artikel> Artikels;

  ArtikelListScreen({required this.Artikels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel List'),
      ),
      body: ListView.builder(
        itemCount: Artikels.length,
        itemBuilder: (context, index) {
          final Artikel = Artikels[index];
          return ListTile(
            title: Text(Artikel.judul),
            subtitle: Text(Artikel.tanggal),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ArtikelPage(),
  ));
}
