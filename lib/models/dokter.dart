class Dokter {
  final int id_dokter;
  final String nama_dokter;
  final String spesialis;
  final String hari_praktek;
  final String jam_praktek;
  final double rating;
  final String alumni;
  final String pengalaman;
  final int nomor_str;
  final String foto_dokter;

  Dokter({
    required this.id_dokter,
    required this.nama_dokter,
    required this.spesialis,
    required this.hari_praktek,
    required this.jam_praktek,
    required this.rating,
    required this.alumni,
    required this.pengalaman,
    required this.nomor_str,
    required this.foto_dokter,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id_dokter': id_dokter,
  //     'nama_dokter': nama_dokter,
  //     'spesialis': spesialis,
  //     'hari_praktek': hari_praktek,
  //     'jam_praktek': jam_praktek,
  //     'foto_dokter': foto_dokter,
  //   };
  // }

  // factory Dokter.fromMap(Map<String, dynamic> map) {
  //   return Dokter(
  //     id_dokter: map['id_dokter'],
  //     nama_dokter: map['nama_dokter'],
  //     spesialis: map['spesialis'],
  //     hari_praktek: map['hari_praktek'],
  //     jam_praktek: map['jam_praktek'],
  //     foto_dokter: map['foto_dokter'],
  //   );
  // }

  factory Dokter.fromJson(Map<String, dynamic> json) {
    return Dokter(
      id_dokter: json['id_dokter'],
      nama_dokter: json['nama_dokter'],
      spesialis: json['spesialis'],
      hari_praktek: json['hari_praktek'],
      jam_praktek: json['jam_praktek'],
      rating: json['rating'],
      alumni: json['alumni'],
      pengalaman: json['pengalaman'],
      nomor_str: json['nomor_str'],
      foto_dokter: json['foto_dokter'],
    );
  }
}
