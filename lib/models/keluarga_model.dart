class Keluarga {
  final int idKeluarga;
  final int idUser;
  final String nik;
  final String namaKeluarga;
  final String tglLahir;
  final String createAtKeluarga;
  final String updateAtKeluarga;

  Keluarga({
    required this.idKeluarga,
    required this.idUser,
    required this.nik,
    required this.namaKeluarga,
    required this.tglLahir,
    required this.createAtKeluarga,
    required this.updateAtKeluarga,
  });

  factory Keluarga.fromJson(Map<String, dynamic> json) {
    return Keluarga(
      idKeluarga: json['id_keluarga'] ?? 0,
      idUser: json['id_user'] ?? 0,
      nik: json['nik'] ?? '',
      namaKeluarga: json['nama_keluarga'] ?? '',
      tglLahir: json['tgl_lahir'] ?? '',
      createAtKeluarga: json['create_at_keluarga'] ?? '',
      updateAtKeluarga: json['update_at_keluarga'] ?? '',
    );
  }
}
