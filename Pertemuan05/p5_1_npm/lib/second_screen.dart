import 'package:flutter/material.dart';

/// SecondScreen - Halaman kedua untuk demonstrasi navigasi
/// Menampilkan tombol untuk kembali ke halaman sebelumnya
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Kembali'),
          onPressed: () {
            // Navigator.pop() menghapus halaman saat ini dari stack navigasi
            // dan kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
