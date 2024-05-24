class Artikel {
  final int id;
  final String judul;
  final String tanggal;
  final String isi;
  final String foto;

  Artikel({
    required this.id,
    required this.judul,
    required this.tanggal,
    required this.isi,
    required this.foto,
  });

  factory Artikel.fromJson(Map<String, dynamic> json) {
    return Artikel(
      id: json['id'],
      judul: json['judul'],
      tanggal: json['tanggal'],
      isi: json['isi'],
      foto: json['foto'],
    );
  }
}