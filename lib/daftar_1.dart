import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/daftar_model.dart';
import 'daftar_2.dart';

class DaftarPage extends StatefulWidget {
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  Future<void> _navigateToNextPage() async {
    final daftarModel = Provider.of<DaftarModel>(context, listen: false);
    final nik = nikController.text;

    // Check NIK
    try {
      final nikExists = await daftarModel.checkNik(nik);
      print('NIK is available: $nikExists');
      if (!nikExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('NIK sudah terdaftar, silakan gunakan NIK lain.')),
        );
        return;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memeriksa NIK.')),
      );
      return;
    }

    // Save data to UserModel
    daftarModel.setNik(nik);
    daftarModel.setNama(namaController.text);
    daftarModel.setTglLahir(tglLahirController.text);

    print('Navigating to next page...');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DaftarPWPage()),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        tglLahirController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Rawatjalan.id',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[500],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang di Rawatjalan.id',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  'Silahkan isi data diri Anda dengan sesuai',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TextFormField(
                    controller: nikController,
                    decoration: InputDecoration(
                      labelText: 'Nomor Induk Kependudukkan',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TextFormField(
                    controller: namaController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TextFormField(
                    controller: tglLahirController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month_outlined),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 40),
                    side: BorderSide(color: Colors.teal, width: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Lanjut', style: TextStyle(color: Colors.teal, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
