class Dokter {
  final int id_dokter;
  final String nama_dokter;
  final double rating;
  final String alumni;
  final String pengalaman;
  final int nomor_str;
  final String foto_dokter;
  final String? create_at_dokter;
  final String? update_at_dokter;
  final String jenis_spesialis;
  final String hari;
  final String jam;

  Dokter({
    required this.id_dokter,
    required this.nama_dokter,
    required this.rating,
    required this.alumni,
    required this.pengalaman,
    required this.nomor_str,
    required this.foto_dokter,
    this.create_at_dokter,
    this.update_at_dokter,
    required this.jenis_spesialis,
    required this.hari,
    required this.jam,
  });

  factory Dokter.fromJson(Map<String, dynamic> json) {
    return Dokter(
      id_dokter: json['id_dokter'],
      nama_dokter: json['nama_dokter'],
      rating: json['rating'],
      alumni: json['alumni'],
      pengalaman: json['pengalaman'],
      nomor_str: json['nomor_str'],
      foto_dokter: json['foto_dokter'],
      create_at_dokter: json['create_at_dokter'],
      update_at_dokter: json['update_at_dokter'],
      jenis_spesialis: json['jenis_spesialis'],
      hari: json['hari'],
      jam: json['jam'],
    );
  }
}