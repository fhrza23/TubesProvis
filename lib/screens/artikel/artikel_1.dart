import 'package:flutter/material.dart';
import '../../models/artikel_model.dart';
import '../../../../services/artikel_service.dart';
import 'artikel_2.dart';

class ArtikelPage extends StatefulWidget {
  @override
  _ArtikelPageState createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  late List<Artikel> _artikels = [];
  final ArtikelService _artikelService = ArtikelService();

  @override
  void initState() {
    super.initState();
    fetchArtikels();
  }

  Future<void> fetchArtikels() async {
    print('fetchArtikels called');
    try {
      final artikels = await _artikelService.fetchArtikels();
      print('fetchArtikels: Articles fetched: ${artikels.length}');
      setState(() {
        _artikels = artikels;
      });
    } catch (e) {
      print('fetchArtikels: Failed to fetch Artikels: $e');
    }
  }

  Future<void> fetchArtikelById(int id) async {
    print('fetchArtikelById called with id: $id');
    try {
      final artikel = await _artikelService.fetchArtikelById(id);
      print('fetchArtikelById: Article fetched: ${artikel.judul}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ArtikelDetailPage(artikel: artikel)),
      );
    } catch (e) {
      print('fetchArtikelById: Failed to fetch Artikel by ID: $e');
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
          _artikels.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: _artikels.length,
                    itemBuilder: (context, index) {
                      final artikel = _artikels[index];
                      return InkWell(
                        onTap: () {
                          // Ketika artikel diklik, ambil detail artikel berdasarkan ID
                          fetchArtikelById(artikel.id);
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
                                    child: Image.network(
                                      artikel.foto,
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
                                      artikel.judul,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      artikel.tanggal,
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