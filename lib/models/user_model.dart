class UserModel {
  final int? id;
  final String nik;
  final String nama;
  final String tanggalLahir;
  final String noHp;
  final String password;

  UserModel({
    this.id,
    required this.nik,
    required this.nama,
    required this.tanggalLahir,
    required this.noHp,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nik: json['nik'] ?? '',
      nama: json['nama'] ?? '',
      tanggalLahir: json['tanggal_lahir'] ?? '',
      noHp: json['no_hp'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nik': nik,
      'nama': nama,
      'tanggal_lahir': tanggalLahir,
      'no_hp': noHp,
      'password': password,
    };
  }
}
