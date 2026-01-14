import 'package:flutter/material.dart';

/// MyImageAsset - Widget untuk menampilkan gambar dari asset lokal
/// Menggunakan Image.asset() untuk memuat gambar dari folder assets
class MyImageAsset extends StatelessWidget {
  const MyImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari Asset'),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/ulbi.jpg',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
