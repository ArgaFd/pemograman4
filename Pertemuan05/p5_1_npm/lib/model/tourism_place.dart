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
    name: 'Ranca Upas',
    location: 'Ciwidey, Bandung',
    description:
        'Ranca Upas adalah kawasan bumi perkemahan di ketinggian 1.700 mdpl dengan pemandangan alam indah dan udara sejuk.',
    openDays: 'Buka Setiap Hari',
    openTime: '24 Jam',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'assets/images/ranca_upas.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg',
    ],
  ),
  TourismPlace(
    name: 'Kawah Putih',
    location: 'Ciwidey, Bandung',
    description:
        'Kawah Putih adalah danau kawah dari Gunung Patuha dengan warna air putih kehijauan yang unik.',
    openDays: 'Senin - Minggu',
    openTime: '07:00 - 17:00',
    ticketPrice: 'Rp 28.000',
    imageAsset: 'assets/images/kawah_putih.jpeg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/0a/de/d5/e0/stone-garden.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/15/10/0b/d9/p-20181111-110814-largejpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/19/ce/b4/9e/img-20191225-114306-largejpg.jpg',
    ],
  ),
  TourismPlace(
    name: 'Tangkuban Perahu',
    location: 'Lembang, Bandung',
    description:
        'Tangkuban Perahu adalah gunung berapi aktif yang berbentuk seperti perahu terbalik.',
    openDays: 'Senin - Minggu',
    openTime: '07:00 - 17:00',
    ticketPrice: 'Rp 30.000',
    imageAsset: 'assets/images/tangkuban_perahu.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/12/6b/63/0b/tangkuban-perahu.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/19/15/01/e3/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/17/67/d5/13/photo1jpg.jpg',
    ],
  ),
];
