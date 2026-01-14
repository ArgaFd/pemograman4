import 'package:flutter/material.dart';
import 'model/tourism_place.dart';
import 'detail_screen.dart';

/// MainScreen - Halaman utama yang menampilkan daftar tempat wisata
/// Menggunakan ListView.builder untuk menampilkan list secara efisien
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Bandung'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: tourismPlaceList.length,
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            // InkWell memberikan efek ripple saat di-tap
            onTap: () {
              // Navigasi ke DetailScreen dengan mengirim data place
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(place: place),
                ),
              );
            },
            child: Card(
              // Card memberikan efek elevasi (bayangan)
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Gambar tempat wisata dengan AspectRatio
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        place.imageAsset,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Tampilkan placeholder jika gambar tidak ditemukan
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Informasi tempat wisata
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Staatliches',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  place.location,
                                  style: const TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
