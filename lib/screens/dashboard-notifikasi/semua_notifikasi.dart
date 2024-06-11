import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../models/notif.dart';
import 'package:intl/intl.dart';

class NotificationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 136, 120, 1),
        title: Text("Notifications"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.person),
        //     color: Colors.white,
        //     onPressed: () {
        //       // Navigate to user profile
        //     },
        //   ),
        // ],
      ),
      body: NotificationListView(),
    );
  }
}

class NotificationListView extends StatefulWidget {
  @override
  _NotificationListViewState createState() => _NotificationListViewState();
}

class _NotificationListViewState extends State<NotificationListView> {
  late Future<List<Notifikasi>> futureNotifications;

  @override
  void initState() {
    super.initState();
    futureNotifications = ApiService().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Notifikasi>>(
      future: futureNotifications,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No notifications found"));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Notifikasi notification = snapshot.data![index];
              String formattedTime = formatNotificationTime(notification.time);
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(35, 136, 120, 1),
                  child: Icon(Icons.notifications, color: Colors.white),
                ),
                title: Text(
                  notification.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification.subtitle),
                    Text(
                      formattedTime,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                onTap: () {
                  // Handle notification tap
                },
              );
            },
          );
        }
      },
    );
  }

  String formatNotificationTime(String timeString) {
    DateTime time = DateTime.parse(timeString);
    Duration difference = DateTime.now().difference(time);

    if (difference.inDays > 0) {
      return DateFormat.yMMMd().format(time); // Tampilkan tanggal jika lebih dari 1 hari yang lalu
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} menit yang lalu';
    } else {
      return 'Baru saja';
    }
  }
}
