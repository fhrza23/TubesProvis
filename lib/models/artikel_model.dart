class Artikel {
  final int id;
  final String judul;
  final String tanggal;
  final String isi;
  final String foto;
  final String createAt;
  final String updateAt;

  Artikel({
    required this.id,
    required this.judul,
    required this.tanggal,
    required this.isi,
    required this.foto,
    required this.createAt,
    required this.updateAt,
  });

  factory Artikel.fromJson(Map<String, dynamic> json) {
    return Artikel(
      id: json['id'] ?? 0,
      judul: json['judul'] ?? '',
      tanggal: json['tanggal'] ?? '',
      isi: json['isi'] ?? '',
      foto: json['foto'] ?? '',
      createAt: json['create_at_artikel'] ?? '',
      updateAt: json['update_at_artikel'] ?? '',
    );
  }
}
