import 'package:flutter/material.dart';
import 'main_screen.dart';

/// Fungsi main() adalah entry point aplikasi Flutter
/// runApp() menjalankan aplikasi dengan widget MyApp sebagai root
void main() {
  runApp(const MyApp());
}

/// MyApp adalah root widget aplikasi
/// StatelessWidget karena tidak memiliki state yang berubah
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      // Theme mengatur tampilan global aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false, // Menggunakan Material Design 2
      ),
      // MainScreen sebagai halaman awal aplikasi
      home: const MainScreen(),
    );
  }
}
