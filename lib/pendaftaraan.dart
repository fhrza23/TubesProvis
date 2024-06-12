// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'screens/dashboard/dashboard.dart';
// import 'qr_booking.dart';
// // import 'status_pemeriksaan.dart';


// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Laman Pendaftaran',
// //       theme: ThemeData(
// //         primaryColor: Colors.teal,
// //         fontFamily: 'Montserrat',
// //       ),
// //       home: AppointmentRegistrationPage(),
// //     );
// //   }
// // }

// class AppointmentRegistrationPage extends StatefulWidget {
//   @override
//   _AppointmentRegistrationPageState createState() => _AppointmentRegistrationPageState();
// }

// class _AppointmentRegistrationPageState extends State<AppointmentRegistrationPage> {
//   String selectedFamilyMember = 'Sarah';
//   String selectedPoli = 'Poli Umum';
//   String selectedDoctor = 'Dr. Smith';
//   DateTime selectedDate = DateTime.now();
//   bool isInsurance = false;
//   String selectedInsurance = 'Prodia';

//   List<String> familyMembers = ['Sarah', 'Budi Santoso', 'Maya'];
//   List<String> poliOptions = ['Poli Umum', 'Poli Anak', 'Poli Gigi'];
//   List<String> doctorOptions = ['Dr. Smith', 'Dr. Johnson', 'Dr. Brown'];
//   List<String> insuranceOptions = ['Prodia', 'AXA', 'BPJS'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.teal, 
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: SingleChildScrollView(
//         child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Laman Pendaftaran',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             Align(
//               alignment: Alignment.center,
//               child:Text('Pilih Anggota Keluarga', style: TextStyle(fontWeight: FontWeight.bold,)),
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: DropdownButtonFormField(
//                 value: selectedFamilyMember,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedFamilyMember = newValue!;
//                   });
//                 },
//                 items: familyMembers
//                     .map((member) => DropdownMenuItem(
//                           value: member,
//                           child: Text(member),
//                         ))
//                     .toList(),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Align(
//               alignment: Alignment.center,
//               child: Text('Pilih Poli', style: TextStyle(fontWeight: FontWeight.bold,)),
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: DropdownButtonFormField(
//                 value: selectedPoli,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedPoli = newValue!;
//                   });
//                 },
//                 items: poliOptions
//                     .map((poli) => DropdownMenuItem(
//                           value: poli,
//                           child: Text(poli),
//                         ))
//                     .toList(),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Align(
//               alignment: Alignment.center,
//               child: Text('Pilih Dokter', style: TextStyle(fontWeight: FontWeight.bold,)),
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: DropdownButtonFormField(
//                 value: selectedDoctor,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedDoctor = newValue!;
//                   });
//                 },
//                 items: doctorOptions
//                     .map((doctor) => DropdownMenuItem(
//                           value: doctor,
//                           child: Text(doctor),
//                         ))
//                     .toList(),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'Pilih Tanggal',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Column(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.calendar_today),
//                     onPressed: () async {
//                       final DateTime? picked = await showDatePicker(
//                         context: context,
//                         initialDate: selectedDate,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2101),
//                       );
//                       if (picked != null && picked != selectedDate) {
//                         setState(() {
//                           selectedDate = picked;
//                         });
//                       }
//                     },
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     DateFormat.yMd().format(selectedDate),
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isInsurance = true;
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: isInsurance ? Colors.teal : Colors.grey[200],
//                     ),
//                     child: Text(
//                       'Asuransi',
//                       style: TextStyle(
//                         color: isInsurance ? Colors.white : Colors.teal,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isInsurance = false;
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: !isInsurance ? Colors.teal : Colors.grey[200],
//                     ),
//                     child: Text(
//                       'Non Asuransi',
//                       style: TextStyle(
//                         color: !isInsurance ? Colors.white : Colors.teal,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             if (isInsurance)
//               Column(
//                 children: [
//                   DropdownButtonFormField(
//                     value: selectedInsurance,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedInsurance = newValue!;
//                       });
//                     },
//                     items: insuranceOptions
//                         .map((insurance) => DropdownMenuItem(
//                               value: insurance,
//                               child: Text(insurance),
//                             ))
//                         .toList(),
//                     decoration: InputDecoration(
//                       labelText: 'Pilih Asuransi',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle file upload
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey[200],
//                     ),
//                     child: Text(
//                       'Upload Foto',
//                       style: TextStyle(color: Colors.teal),
//                     ),
//                   ),
//                 ],
//               ),
            
//             SizedBox(height: 16),
//             Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Handle appointment registration
//                   Navigator.push(
//                     context, 
//                     MaterialPageRoute(builder: (context) => CheckUpPage())
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   side: BorderSide(color: Colors.teal),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: Text(
//                   'Daftar',
//                   style: TextStyle(
//                     color: Colors.teal,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '/screens/dashboard/dashboard.dart';
import 'qr_booking.dart';
import 'services/api_service.dart';
// import 'status_pemeriksaan.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Laman Pendaftaran',
//       theme: ThemeData(
//         primaryColor: Colors.teal,
//         fontFamily: 'Montserrat',
//       ),
//       home: AppointmentRegistrationPage(),
//     );
//   }
// }

class AppointmentRegistrationPage extends StatefulWidget {
  @override      
  _AppointmentRegistrationPageState createState() => _AppointmentRegistrationPageState();
}

class _AppointmentRegistrationPageState extends State<AppointmentRegistrationPage> {
  List<Map<String, dynamic>> doctorOptions = [];
  int? selectedDoctor;

  List<Map<String, dynamic>> spesialisList = [];
  int? selectedSpesialisId;

  List<String> asuransiOptions = [];
  String? selectedAsuransi;

  List<Map<String, dynamic>> keluargaList = [];
  int? selectedKeluargaId;

  List<Map<String, dynamic>> jadwalList = [];
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  bool isInsurance = false;
  final pendaftaranService service = pendaftaranService();

  @override     
  void initState() {
    super.initState();
    _fetchSpesialis();
    _fetchKeluarga();
    initializeDateFormatting('id_ID', null);
  }

 Future<void> _fetchKeluarga() async {
    try {
      List<Map<String, dynamic>> fetchedList = await service.getKeluarga();
      setState(() {
        keluargaList = fetchedList;
        selectedKeluargaId = keluargaList.isNotEmpty ? keluargaList[0]['id_keluarga'] : null;
        if (selectedKeluargaId != null) {
          _fetchAsuransiOptions(selectedKeluargaId!);
        }
      });
    } catch (e) {
      print('Failed to load keluarga list: $e');
    }
  }

  Future<void> _fetchAsuransiOptions(int keluargaId) async {
    try {
      List<Map<String, dynamic>> options = await service.getAsuransiByKeluarga(keluargaId);
      setState(() {
        asuransiOptions = options.map((asuransi) => asuransi['nama_asuransi'].toString()).toList();
        selectedAsuransi = asuransiOptions.isNotEmpty ? asuransiOptions[0] : '';
      });
    } catch (e) {
      print('Failed to fetch asuransi options: $e');
    }
  } 

  Future<void> _fetchSpesialis() async {
    try {
      List<Map<String, dynamic>> fetchedList = await service.getSpesialis();
      setState(() {
        spesialisList = fetchedList;
         if (spesialisList.isNotEmpty) {
          selectedSpesialisId = spesialisList[0]['id_spesialis'];
          _fetchDoctorOptions(selectedSpesialisId!);
        } else {
          selectedSpesialisId = null;
        }
      });
    } catch (e) {
      print('Failed to load spesialis list: $e');
    }
  }

  Future<void> _fetchDoctorOptions(int spesialisId) async {
    try {
      List<Map<String, dynamic>> options = await service.getDokterBySpesialis(spesialisId);
      setState(() {
        doctorOptions = options;
        selectedDoctor = doctorOptions.isNotEmpty ? doctorOptions[0]['id_dokter'] : null;
      });
    } catch (e) {
      print('Failed to fetch doctor options: $e');
    }
  }

  Future<void> _fetchJadwalDokter(int dokterId, String hari) async {
    try {
      List<Map<String, dynamic>> fetchedList = await service.getJadwalDokter(dokterId, hari);
      setState(() {
        jadwalList = fetchedList;
        selectedTime = jadwalList.isNotEmpty ? jadwalList[0]['jam'] : null;
      });
    } catch (e) {
      print('Failed to fetch jadwal list: $e');
    }
  }

  Future<void> _registerAppointment() async {
    try {
      // Menambahkan pemeriksaan jika selectedKeluargaId null
      if (selectedKeluargaId == null) {
        throw Exception('selectedKeluargaId belum dipilih');
      }

      // Mengambil nama keluarga dari keluargaList jika selectedKeluargaId ditemukan
      // final idUser = 
      final selectedKeluarga = keluargaList.firstWhere((keluarga) => keluarga['id_keluarga'] == selectedKeluargaId);
      final namaKeluarga = selectedKeluarga['nama_keluarga'].toString();

      // Mengonversi tanggal janji menjadi format yang diinginkan
      final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      
      // Memanggil metode untuk mendaftar janji temu
      await service.registerAppointment(
        // idUser: 0,
        idKeluarga: selectedKeluargaId!,
        idDokter: selectedDoctor!,
        namaKeluarga: namaKeluarga,
        selectedDate: formattedDate
      );
      // Handle success: navigate to another screen or show success message
    } catch (e) {
      // Handle error: show error message to the user
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    // Ensure selectedDoctor is valid
  if (doctorOptions.isNotEmpty && selectedDoctor != null && !doctorOptions.any((doctor) => doctor['id_dokter'] == selectedDoctor)) {
    selectedDoctor = null;
  }

  // Ensure selectedSpesialisId is valid
  if (selectedSpesialisId != null && !spesialisList.any((spesialis) => spesialis['id_spesialis'] == selectedSpesialisId)) {
    selectedSpesialisId = null;
  }

  // Ensure selectedKeluargaId is valid
  if (selectedKeluargaId != null && !keluargaList.any((keluarga) => keluarga['id_keluarga'] == selectedKeluargaId)) {
    selectedKeluargaId = null;
  }

  // Ensure selectedAsuransi is valid
  if (asuransiOptions.isNotEmpty && selectedAsuransi != null && !asuransiOptions.contains(selectedAsuransi)) {
    selectedAsuransi = null;
  }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal, 
          leading: IconButton(
            icon: Icon(Icons.arrow_circle_left, color: Colors.white), 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white), 
              onPressed: () {
               
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white), 
              onPressed: () {
                
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Laman Pendaftaran',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child:Text('Pilih Anggota Keluarga', style: TextStyle(fontWeight: FontWeight.bold,)),
            ),
            Container(
                alignment: Alignment.center,
                child: DropdownButtonFormField<int>(
                  value: keluargaList.isNotEmpty ? selectedKeluargaId : null,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedKeluargaId = newValue;
                      if (selectedKeluargaId != null) {
                        _fetchAsuransiOptions(selectedKeluargaId!);
                      }
                    });
                  },
                  items: keluargaList.map((keluarga) {
                    return DropdownMenuItem<int>(
                      value: keluarga['id_keluarga'],
                      child: Text(keluarga['nama_keluarga']),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text('Pilih Spesialis', style: TextStyle(fontWeight: FontWeight.bold,)),
            ),
            Container(
                alignment: Alignment.center,
                child: DropdownButtonFormField<int>(
                  value: selectedSpesialisId,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedSpesialisId = newValue;
                      if (selectedSpesialisId != null) {
                        _fetchDoctorOptions(selectedSpesialisId!);
                      }
                    });
                  },
                  items: spesialisList.map((spesialis) {
                    return DropdownMenuItem<int>(
                      value: spesialis['id_spesialis'],
                      child: Text(spesialis['jenis_spesialis']),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Pilih Spesialis',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text('Pilih Dokter', style: TextStyle(fontWeight: FontWeight.bold,)),
            ),
            Container(
                alignment: Alignment.center,
                child: DropdownButtonFormField<int>(
                  value: doctorOptions.isNotEmpty && selectedDoctor != null &&
                        doctorOptions.any((doctor) => doctor['id_dokter'] == selectedDoctor)
                        ? selectedDoctor
                        : doctorOptions.isNotEmpty
                        ? doctorOptions[0]['id_dokter']
                        : null,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedDoctor = newValue;
                      if (selectedDoctor != null) {
                        _fetchJadwalDokter(selectedDoctor!,  Intl.withLocale('id_ID', () => DateFormat('EEEE').format(selectedDate)));
                      }
                    });
                  },
                  items: doctorOptions.map((dokter) {
                    return DropdownMenuItem<int>(
                      value: dokter['id_dokter'],
                      child: Text(dokter['nama_dokter']),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Pilih Dokter',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 16),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Pilih Tanggal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text(DateFormat('dd MMMM yyyy').format(selectedDate)),
                          onPressed: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 1),
                              locale: const Locale('id', 'ID'),
                            );
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                                _fetchJadwalDokter(selectedDoctor!, Intl.withLocale('id_ID', () => DateFormat('EEEE').format(selectedDate)));
                              });
                            }
                          },
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(height: 16),
                    if (jadwalList.isNotEmpty)
                      DropdownButtonFormField<String>(
                        value: selectedTime,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTime = newValue;
                          });
                        },
                        items: jadwalList.map((jadwal) {
                          return DropdownMenuItem<String>(
                            value: jadwal['jam'],
                            child: Text(jadwal['jam']),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Pilih Jam',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    if (jadwalList.isEmpty)
                      Text('Tidak ada jadwal tersedia untuk tanggal ini.'),
                  ],
                ),
              ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isInsurance = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isInsurance ? Colors.teal : Colors.grey[200],
                    ),
                    child: Text(
                      'Asuransi',
                      style: TextStyle(
                        color: isInsurance ? Colors.white : Colors.teal,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isInsurance = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isInsurance ? Colors.teal : Colors.grey[200],
                    ),
                    child: Text(
                      'Non Asuransi',
                      style: TextStyle(
                        color: !isInsurance ? Colors.white : Colors.teal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (isInsurance)
              Column(
                children: [
                  DropdownButtonFormField<String>(
                  value: selectedAsuransi,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedAsuransi = newValue!;
                    });
                  },
                  items: asuransiOptions
                      .map((asuransi) => DropdownMenuItem(
                            value: asuransi,
                            child: Text(asuransi),
                          ))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Pilih Asuransi',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                ],
              ),
            
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _registerAppointment();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => CheckUp())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Daftar',
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}