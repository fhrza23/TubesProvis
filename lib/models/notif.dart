class Notifikasi {
  final int idNotif;
  final int tipeNotif;
  final String title;
  final String subtitle;
  final String time;
  final int idNews;
  final String content;

  Notifikasi({
    required this.idNotif,
    required this.tipeNotif,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.idNews,
    required this.content,
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json) {
    return Notifikasi(
      idNotif: json['id_notif'],
      tipeNotif: json['tipe_notif'],
      title: json['title'],
      subtitle: json['subtitle'],
      time: json['time'],
      idNews: json['id_news'],
      content: json['content'],
    );
  }
}
