import 'package:flutter/material.dart';
import 'second_screen.dart';

/// FirstScreen - Halaman pertama untuk demonstrasi navigasi
/// Menampilkan tombol untuk berpindah ke SecondScreen
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            // Navigator.push() digunakan untuk menambahkan halaman baru ke stack navigasi
            // MaterialPageRoute membuat transisi halaman dengan animasi material design
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
