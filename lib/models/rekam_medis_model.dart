class RekamMedis {
  final int idRekamMedis;
  final int idUser;
  final int idKeluarga;
  final int idDokter;
  final String tanggal;
  final String diagnosis;
  final String resepObat;
  final String createAtRekamMedis;
  final String updateAtRekamMedis;
  final String namaKeluarga;
  final String tglLahir;
  final String nik;
  final String namaDokter;
  final String fotoDokter;

  RekamMedis({
    required this.idRekamMedis,
    required this.idUser,
    required this.idKeluarga,
    required this.idDokter,
    required this.tanggal,
    required this.diagnosis,
    required this.resepObat,
    required this.createAtRekamMedis,
    required this.updateAtRekamMedis,
    required this.namaKeluarga,
    required this.tglLahir,
    required this.nik,
    required this.namaDokter,
    required this.fotoDokter,
  });

  factory RekamMedis.fromJson(Map<String, dynamic> json) {
    return RekamMedis(
      idRekamMedis: json['id_rekam_medis'] ?? 0,
      idUser: json['id_user'] ?? 0,
      idKeluarga: json['id_keluarga'] ?? 0,
      idDokter: json['id_dokter'] ?? 0,
      tanggal: json['tanggal'] ?? '',
      diagnosis: json['diagnosis'] ?? '',
      resepObat: json['resep_obat'] ?? '',
      createAtRekamMedis: json['create_at_rekam_medis'] ?? '',
      updateAtRekamMedis: json['update_at_rekam_medis'] ?? '',
      namaKeluarga: json['nama_keluarga'] ?? '',
      tglLahir: json['tgl_lahir'] ?? '',
      nik: json['nik'] ?? '',
      namaDokter: json['nama_dokter'] ?? '',
      fotoDokter: json['foto_dokter'] ?? '',
    );
  }
}