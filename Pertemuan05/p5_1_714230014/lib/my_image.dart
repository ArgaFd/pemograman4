import 'package:flutter/material.dart';

/// MyImage - Widget untuk menampilkan gambar dari internet
/// Menggunakan Image.network() untuk memuat gambar dari URL
class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari Internet'),
      ),
      body: Center(
        child: Image.network(
          'https://picsum.photos/200/300',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
