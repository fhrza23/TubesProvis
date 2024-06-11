import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'screens/dashboard-notifikasi/dashboard.dart';
import 'qr_booking.dart';
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
  String selectedFamilyMember = 'Sarah';
  String selectedPoli = 'Poli Umum';
  String selectedDoctor = 'Dr. Smith';
  DateTime selectedDate = DateTime.now();
  bool isInsurance = false;
  String selectedInsurance = 'Prodia';

  List<String> familyMembers = ['Sarah', 'Budi Santoso', 'Maya'];
  List<String> poliOptions = ['Poli Umum', 'Poli Anak', 'Poli Gigi'];
  List<String> doctorOptions = ['Dr. Smith', 'Dr. Johnson', 'Dr. Brown'];
  List<String> insuranceOptions = ['Prodia', 'AXA', 'BPJS'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal, 
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
              child: DropdownButtonFormField(
                value: selectedFamilyMember,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFamilyMember = newValue!;
                  });
                },
                items: familyMembers
                    .map((member) => DropdownMenuItem(
                          value: member,
                          child: Text(member),
                        ))
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text('Pilih Poli', style: TextStyle(fontWeight: FontWeight.bold,)),
            ),
            Container(
              alignment: Alignment.center,
              child: DropdownButtonFormField(
                value: selectedPoli,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPoli = newValue!;
                  });
                },
                items: poliOptions
                    .map((poli) => DropdownMenuItem(
                          value: poli,
                          child: Text(poli),
                        ))
                    .toList(),
                decoration: InputDecoration(
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
              child: DropdownButtonFormField(
                value: selectedDoctor,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDoctor = newValue!;
                  });
                },
                items: doctorOptions
                    .map((doctor) => DropdownMenuItem(
                          value: doctor,
                          child: Text(doctor),
                        ))
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
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
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 5),
                  Text(
                    DateFormat.yMd().format(selectedDate),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                  DropdownButtonFormField(
                    value: selectedInsurance,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedInsurance = newValue!;
                      });
                    },
                    items: insuranceOptions
                        .map((insurance) => DropdownMenuItem(
                              value: insurance,
                              child: Text(insurance),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Pilih Asuransi',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle file upload
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                    ),
                    child: Text(
                      'Upload Foto',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Handle appointment registration
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => CheckUpPage())
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