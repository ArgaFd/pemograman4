import 'package:flutter/material.dart';
import 'model/tourism_place.dart';

/// DetailScreen - Halaman detail tempat wisata
/// Menerima parameter TourismPlace untuk menampilkan informasi lengkap
class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Stack untuk menempatkan tombol kembali di atas gambar
              Stack(
                children: <Widget>[
                  // Gambar utama tempat wisata
                  Image.asset(
                    place.imageAsset,
                    fit: BoxFit.cover,
                    height: 350,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 350,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 100,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                  // Tombol kembali dengan CircleAvatar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // Informasi detail tempat wisata
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Nama tempat wisata
                    Text(
                      place.name,
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Staatliches',
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Lokasi
                    Row(
                      children: <Widget>[
                        const Icon(Icons.location_on, color: Colors.red),
                        const SizedBox(width: 4),
                        Text(
                          place.location,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Informasi dalam row (hari buka, jam buka, harga tiket)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Hari buka
                        Column(
                          children: <Widget>[
                            const Icon(Icons.calendar_today),
                            const SizedBox(height: 8),
                            Text(
                              place.openDays,
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        // Jam buka
                        Column(
                          children: <Widget>[
                            const Icon(Icons.access_time),
                            const SizedBox(height: 8),
                            Text(
                              place.openTime,
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        // Harga tiket
                        Column(
                          children: <Widget>[
                            const Icon(Icons.monetization_on),
                            const SizedBox(height: 8),
                            Text(
                              place.ticketPrice,
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 16),
                    // Deskripsi
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Staatliches',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      place.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16.0, height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    // Galeri gambar horizontal
                    const Text(
                      'Galeri',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Staatliches',
                      ),
                    ),
                    const SizedBox(height: 8),
                    // ListView horizontal untuk galeri gambar
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: place.imageUrls.map((url) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                url,
                                width: 200,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 200,
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
