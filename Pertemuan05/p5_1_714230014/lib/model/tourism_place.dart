/// Model class untuk merepresentasikan data tempat wisata
class TourismPlace {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrls;

  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
  });
}

/// Data statis berisi daftar tempat wisata di Bandung
var tourismPlaceList = [
  TourismPlace(
    name: 'Farm House Lembang',
    location: 'Lembang, Bandung',
    description:
        'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
    openDays: 'Setiap Hari',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 50.000',
    imageAsset: 'assets/images/farm-house.jpg',
    imageUrls: [
      'assets/images/farm-house.jpg',
      'assets/images/ranca-upas.jpg',
      'assets/images/floating-market.png',
    ],
  ),
  TourismPlace(
    name: 'Observatorium Bosscha',
    location: 'Lembang, Bandung',
    description:
        'Memiliki beberapa teleskop, antara lain, Refraktor Ganda Zeiss, Schmidt Bimasakti, Refraktor Bamberg, Cassegrain GOTO, dan Teleskop Surya. Refraktor Ganda Zeiss adalah jenis teleskop terbesar untuk meneropong bintang. Benda ini diletakkan pada atap kubah sehingga saat teropong digunakan, atap tersebut harus dibuka. Observatorium Bosscha boleh dikunjungi oleh siapa saja, tanpa terkecuali. Asalkan pada jadwal kunjungan yang telah ditentukan.',
    openDays: 'Senin - Jumat',
    openTime: '09:00 - 13:00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'assets/images/bosscha.jpg',
    imageUrls: [
      'assets/images/bosscha.jpg',
      'assets/images/museum-geologi.jpg',
      'assets/images/stone-garden.jpg',
    ],
  ),
  TourismPlace(
    name: 'Kebun Binatang Bandung',
    location: 'Bandung',
    description:
        'Kebun binatang ini menyediakan berbagai macam koleksi hewan yang menarik untuk dilihat. Pengunjung dapat menikmati beraneka ragam satwa dari dalam dan luar negeri. Terdapat juga wahana permainan anak-anak dan area piknik yang luas.',
    openDays: 'Setiap Hari',
    openTime: '08:00 - 16:00',
    ticketPrice: 'Rp 40.000',
    imageAsset: 'assets/images/taman-film.jpg',
    imageUrls: [
      'assets/images/taman-film.jpg',
      'assets/images/jalan-asia-afrika.jpg',
      'assets/images/kawah-putih.jpg',
    ],
  ),
];
