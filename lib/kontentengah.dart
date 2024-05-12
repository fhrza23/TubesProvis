import 'package:flutter/material.dart';
import 'login_1.dart';
import 'daftar_1.dart';

class konten extends StatelessWidget {
  const konten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          // AddIcon(size: 50, color: Colors.teal),
          // AddIcon(fillColor: Colors.white, outlineColor: Colors.teal, size: 20),
          SizedBox(height: 60),
          Icon(
            Icons.add,
            size: 200,
            color: Colors.teal[500],
          ),
          SizedBox(height: 20,),
          Text('Rawatjalan.id',style: TextStyle(
            color: Colors.teal[500], 
            fontSize: 20, 
            fontFamily: 'Monsterrat',
            fontWeight: FontWeight.bold, 
            )
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              // Aksi ketika tombol login ditekan
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 50), 
              side: BorderSide(color: Colors.teal, width: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Text('Masuk',style: TextStyle(color: Colors.teal, fontSize: 20)),
          ),
          SizedBox(height: 10), // Spacer
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DaftarPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 50), 
              side: BorderSide(color: Colors.teal, width: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Text('Daftar',style: TextStyle(color: Colors.teal, fontSize: 20)),
          ),
        ]
      ),
    );
  }
}