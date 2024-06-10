import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'provider/dokter_provider.dart';
import 'models/dokter_model.dart';

// void main() 
// {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DokterProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget 
// {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DoctorList(),
//     );
//   }
// }

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedSpesialis;
  String? _selectedHari;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
    final dokterProvider = Provider.of<DokterProvider>(context, listen: false);
    dokterProvider.fetchDokter();
  }

  void _onSearchTextChanged() {
    final query = _searchController.text.toLowerCase();
    final dokterProvider = Provider.of<DokterProvider>(context, listen: false);

    dokterProvider.searchDokter(query);
  }

  void _onSearchSubmitted(String value) {
    Provider.of<DokterProvider>(context, listen: false).searchDokter(value);
  }

  void _onSpesialisChanged(String? newValue) {
    setState(() {
      _selectedSpesialis = newValue;
    });
    Provider.of<DokterProvider>(context, listen: false)
        .filterDokterBySpesialis(newValue == 'Spesialis' ? null : newValue);
  }

  void _onHariChanged(String? newValue) {
    setState(() {
      _selectedHari = newValue;
    });
    Provider.of<DokterProvider>(context, listen: false)
    .filterDokterByHari(newValue == 'Semua' ? null : (newValue == 'Senin' ? 'Senin' : (newValue == 'Selasa' ? 'Selasa' : (newValue == 'Rabu' ? 'Rabu': (newValue == 'Kamis' ? 'Kamis' : (newValue == 'Jumat' ? 'Jumat' : 'Sabtu' ))))));
  }

  @override
  Widget build(BuildContext context) {
    final dokterProvider = Provider.of<DokterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //   onPressed: () {
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(builder: (context) => Dashboard())
        //     // );
        //   },
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Handle profile
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 18, top: 20, bottom: 20),
            child: Text(
              'Dokter Kami',
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 14),
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Cari dokter...',
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              _onSearchSubmitted(value);
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 30.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF00897B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        dropdownColor: Color(0xFF00897B),
                        value: _selectedSpesialis,
                        items: dokterProvider.spesialisList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: Colors.white, fontSize: 12)),
                          );
                        }).toList(),
                        onChanged: _onSpesialisChanged,
                        hint: Text(
                          'Spesialis',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF00897B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        dropdownColor: Color(0xFF00897B),
                        value: _selectedHari,
                        // items: dokterProvider.hariList.map((String value) {
                        //   return DropdownMenuItem<String>(
                        //     value: value,
                        //     child: Text(value, style: TextStyle(color: Colors.white, fontSize: 12)),
                        //   );
                        // }).toList(),
                                items: [
          'Senin',
          'Selasa',
          'Rabu',
          'Kamis',
          'Jumat',
          'Sabtu'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(color: Colors.white, fontSize: 12)),
          );
        }).toList(),
                        onChanged: _onHariChanged,
                        hint: Text(
                          'Hari',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: dokterProvider.searchResult.isEmpty && _searchController.text.isNotEmpty
            ? Center(
                child: Text(
                  'Dokter tidak ditemukan',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : ListView.builder(
                itemCount: dokterProvider.searchResult.isNotEmpty
                    ? dokterProvider.searchResult.length
                    : dokterProvider.dokterList.length,
                itemBuilder: (context, index) {
                  Dokter dokter;
                  if (dokterProvider.searchResult.isNotEmpty) {
                    dokter = dokterProvider.searchResult[index];
                  } else {
                    dokter = dokterProvider.dokterList[index];
                  }
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 18),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(dokter.foto_dokter),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dokter.nama_dokter,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'Spesialis ${dokter.jenis_spesialis}',
                                    style: GoogleFonts.hindMadurai(
                                      fontSize: 17,
                                      color: Color(0xFF00897B),
                                    ),
                                  ),
                                  RatingBar(
                                    initialRating: dokter.rating,
                                    allowHalfRating: true,
                                    itemSize: 23,
                                    itemCount: 5,
                                    ratingWidget: RatingWidget(
                                      full: Icon(Icons.star, color: Colors.black),
                                      half: Icon(Icons.star_half, color: Colors.black),
                                      empty: Icon(Icons.star_border, color: Colors.black),
                                    ),
                                    onRatingUpdate: (rating) {
                                      // Handle rating update
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Aksi ketika tombol profil dokter ditekan
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Profil Dokter',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}