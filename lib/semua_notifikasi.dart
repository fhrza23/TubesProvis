import 'package:flutter/material.dart';
import 'user_profile.dart';
// import 'notifikasi_detail.dart';

// Widget untuk menampilkan halaman daftar notifikasi
class NotificationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 136, 120, 1),
        actions: [
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
      body: NotificationListView(), // Widget untuk menampilkan daftar notifikasi
    );
  }
}

// Widget untuk menampilkan daftar notifikasi
class NotificationListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Contoh data notifikasi, Anda bisa mengganti ini dengan data aktual dari sumber Anda
    final List<NotificationItem> notifications = [
      NotificationItem(
        icon: Icons.notifications_active,
        title: 'Reminder!',
        subtitle: '5 Antrian lagi menuju antrianmu!',
        time: 'Sekarang',
      ),
      NotificationItem(
        icon: Icons.newspaper,
        title: 'Rumah Sakit Sentra Medika Resmi dibuka!',
        subtitle: 'Baca Artikel Sekarang!',
        time: '5 Menit yang lalu',
      ),
      NotificationItem(
        icon: Icons.newspaper,
        title: 'Peranan AI dalam Diagnostik Medis',
        subtitle: 'Baca Artikel Sekarang!',
        time: '18-04-2024',
      ),
      NotificationItem(
        icon: Icons.notifications_active,
        title: 'Reminder',
        subtitle: 'Jangan lupa minum obat!',
        time: '10-04-2024',
      ),
      
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromRGBO(35, 136, 120, 1),
            child: Icon(
              notifications[index].icon,
              color: Colors.white,
            ),
          ),
          title: Text(
            notifications[index].title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(notifications[index].subtitle),
              Text(
                notifications[index].time,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
          onTap: () {
            // Tambahkan logika untuk menangani aksi saat item notifikasi diklik
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => NotificationDetailPage(notification: notifications[index]),
            //   ),
            // );
          },
        );
      },
    );
  }
}

// Model untuk notifikasi
class NotificationItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}