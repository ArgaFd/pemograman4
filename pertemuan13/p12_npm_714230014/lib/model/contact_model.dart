class ContactsModel {
  final String _id;
  final String nama_kontak;
  final String nomor_hp;

  const ContactsModel({
    required String id,
    required this.nama_kontak,
    required this.nomor_hp,
  }) : _id = id;

  String get id => _id;

  factory ContactsModel.fromJson(Map<String, dynamic> json) {
    return ContactsModel(
      id: json['_id'] ?? '',
      nama_kontak: json['nama_kontak'] ?? '',
      nomor_hp: json['nomor_hp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': _id,
      'nama_kontak': nama_kontak,
      'nomor_hp': nomor_hp,
    };
  }
}
