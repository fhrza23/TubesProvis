import 'package:flutter/material.dart';
import '../../services/rekam_medis_service.dart';
import '../../models/rekam_medis_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RekamMedisPage(),
    );
  }
}

class RekamMedisPage extends StatefulWidget {
  @override
  _RekamMedisPageState createState() => _RekamMedisPageState();
}

class _RekamMedisPageState extends State<RekamMedisPage> {
  List<RekamMedis> rekamMedisList = [];

  @override
  void initState() {
    super.initState();
    fetchRekamMedis();
  }

  Future<void> fetchRekamMedis() async {
    try {
      final rekamMedisService = RekamMedisService();
      List<RekamMedis> rekamMedisData = await rekamMedisService.fetchRekamMedis();
      setState(() {
        rekamMedisList = rekamMedisData;
        for (var rekamMedis in rekamMedisList) {
          print('Fetched Rekam Medis: ${rekamMedis.namaKeluarga}, ${rekamMedis.tglLahir}, ${rekamMedis.nik}');
        }
      });
    } catch (e) {
      print('Failed to load Rekam Medis: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 112, 99),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset('images/dokter.jpg'),
                SizedBox(height: 8),
                Text(
                  'Rekam Medis',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 112, 99),
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey, indent: 20, endIndent: 20),
          SizedBox(height: 8),
          rekamMedisList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.builder(
                  itemCount: rekamMedisList.length,
                  itemBuilder: (context, index) {
                    return _buildPasien(context, rekamMedisList[index]);
                  },
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildPasien(BuildContext context, RekamMedis rekamMedis) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RekamMedisDetailPage(rekamMedis: rekamMedis)),
          );
        },
        child: Row(
          children: [
            SizedBox(width: 16),
            ClipOval(
                  child: Image.asset(
            '${rekamMedis.fotoDokter ?? "Data tidak tersedia"}',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
          SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${rekamMedis.namaDokter ?? "Data tidak tersedia"}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${rekamMedis.tanggal ?? "Data tidak tersedia"}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 112, 99),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'NIK: ${rekamMedis.nik ?? "Data tidak tersedia"}',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RekamMedisDetailPage extends StatelessWidget {
  final RekamMedis rekamMedis;

  RekamMedisDetailPage({required this.rekamMedis});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 112, 99),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
          Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Hasil Pemeriksaan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 112, 99),
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${rekamMedis.tanggal}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${rekamMedis.namaDokter}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
                SizedBox(height: 10),
                Text(
                  'Diagnosis',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${rekamMedis.diagnosis}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
                SizedBox(height: 10),
                Text(
                  'Resep Obat',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${rekamMedis.resepObat}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                ),
                Divider(color: Colors.grey, indent: 20, endIndent: 20),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'services/keluarga_service.dart';
// import 'models/keluarga_model.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: KeluargaPage(),
//     );
//   }
// }

// class KeluargaPage extends StatefulWidget {
//   @override
//   _KeluargaPageState createState() => _KeluargaPageState();
// }

// class _KeluargaPageState extends State<KeluargaPage> {
//   List<Keluarga> keluargaList = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchKeluarga();
//   }

//   Future<void> fetchKeluarga() async {
//     try {
//       final keluargaService = KeluargaService();
//       List<Keluarga> keluargaData = await keluargaService.fetchKeluarga(9); // Ganti 9 dengan id_user yang sesuai
//       setState(() {
//         keluargaList = keluargaData;
//         for (var keluarga in keluargaList) {
//           print('Fetched Keluarga: ${keluarga.namaKeluarga}, ${keluarga.tglLahir}, ${keluarga.nik}');
//         }
//       });
//     } catch (e) {
//       print('Failed to load Keluarga: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 0, 112, 99),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Image.asset('images/dokter.jpg'),
//                 SizedBox(height: 8),
//                 Text(
//                   'Rekam Medis',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 0, 112, 99),
//                     fontFamily: 'Montserrat-Bold',
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//           Divider(color: Colors.grey, indent: 20, endIndent: 20),
//           SizedBox(height: 8),
//           keluargaList.isEmpty
//             ? Center(child: CircularProgressIndicator())
//             : Expanded(
//                 child: ListView.builder(
//                   itemCount: keluargaList.length,
//                   itemBuilder: (context, index) {
//                     return _buildKeluarga(context, keluargaList[index]);
//                   },
//                 ),
//               ),
//         ],
//       ),
//     );
//   }

//   Widget _buildKeluarga(BuildContext context, Keluarga keluarga) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: GestureDetector(
//         onTap: () {
//           // Handle tap event
//         },
//         child: Row(
//           children: [
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Nama: ${keluarga.namaKeluarga ?? "Data tidak tersedia"}',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Montserrat',
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Tanggal Lahir: ${keluarga.tglLahir ?? "Data tidak tersedia"}',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 0, 112, 99),
//                       fontFamily: 'Montserrat',
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'NIK: ${keluarga.nik ?? "Data tidak tersedia"}',
//                     style: TextStyle(
//                       fontFamily: 'Montserrat',
//                     ),
//                   ),
//                   SizedBox(height: 2),
//                   Divider(color: Colors.grey),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }