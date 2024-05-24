class User {
  final int id;
  final String nik;
  final String password;
  final String nama;
  final String noHp;

  User({
    required this.id,
    required this.nik,
    required this.password,
    required this.nama,
    required this.noHp,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      nik: json['nik'] ?? '',
      password: json['password'] ?? '',
      nama: json['nama'] ?? '',
      noHp: json['no_hp'] ?? '',
    );
  }
}
