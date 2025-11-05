# LAPORAN PRAKTIKUM PERTEMUAN 5
## Membuat Layout, Image, Font, ListView, dan Navigation

---

## 📋 DAFTAR ISI
1. [Tujuan](#tujuan)
2. [Dasar Teori](#dasar-teori)
3. [Alat dan Bahan](#alat-dan-bahan)
4. [Langkah Kerja](#langkah-kerja)
5. [Hasil dan Tampilan](#hasil-dan-tampilan)
6. [Kesimpulan](#kesimpulan)

---

## 🎯 TUJUAN

Setelah menyelesaikan praktikum ini, mahasiswa diharapkan mampu:

1. Memahami dan mengimplementasikan layout di Flutter
2. Menampilkan gambar dari internet dan asset lokal
3. Menggunakan font custom dalam aplikasi Flutter
4. Membuat list dengan scroll (ListView)
5. Mengimplementasikan navigasi antar halaman
6. Membuat aplikasi multi-halaman dengan passing data

---

## 📚 DASAR TEORI

### 1. Image di Flutter

Flutter menyediakan widget `Image` untuk menampilkan gambar dengan berbagai sumber:

**a. Image.network()**
- Memuat gambar dari URL internet
- Memerlukan koneksi internet
- Contoh: `Image.network('https://example.com/image.jpg')`

**b. Image.asset()**
- Memuat gambar dari folder assets lokal
- Tidak memerlukan koneksi internet
- Lebih cepat karena sudah tersimpan di aplikasi
- Contoh: `Image.asset('assets/images/photo.jpg')`

### 2. Font Custom

Font custom memungkinkan aplikasi memiliki identitas visual yang unik:
- Font disimpan di folder `assets/fonts/`
- Dikonfigurasi di `pubspec.yaml`
- Digunakan melalui properti `fontFamily` pada TextStyle

### 3. ListView

ListView adalah widget untuk menampilkan daftar item yang dapat di-scroll:

**a. ListView biasa**
- Semua item dibuat sekaligus
- Cocok untuk list pendek

**b. ListView.builder**
- Item dibuat secara lazy (on-demand)
- Lebih efisien untuk list panjang
- Menggunakan `itemBuilder` callback

**c. ListView.separated**
- Seperti ListView.builder
- Menambahkan separator di antara item
- Menggunakan `separatorBuilder`

### 4. Navigation

Navigation di Flutter menggunakan konsep stack:

**a. Navigator.push()**
- Menambahkan halaman baru ke stack
- Halaman baru ditampilkan di atas halaman sebelumnya

**b. Navigator.pop()**
- Menghapus halaman teratas dari stack
- Kembali ke halaman sebelumnya

**c. MaterialPageRoute**
- Membuat route dengan animasi Material Design
- Menerima builder function untuk membuat halaman

---

## 🛠️ ALAT DAN BAHAN

1. **Flutter SDK** (versi 3.0 atau lebih baru)
2. **IDE**: Visual Studio Code / Android Studio
3. **Emulator** atau **Physical Device**
4. **Koneksi Internet** (untuk download dependencies dan load gambar)
5. **Font Staatliches** dari Google Fonts
6. **Gambar asset** untuk tempat wisata

---

## 📝 LANGKAH KERJA

### LANGKAH 1: Persiapan Proyek

**1.1 Membuat Proyek Flutter Baru**

```bash
flutter create p5_1_npm
cd p5_1_npm
```

**1.2 Membuat Struktur Folder**

```
p5_1_npm/
├── lib/
│   ├── main.dart
│   ├── first_screen.dart
│   ├── second_screen.dart
│   ├── my_image.dart
│   ├── my_image_asset.dart
│   ├── scrolling_screen.dart
│   ├── main_screen.dart
│   ├── detail_screen.dart
│   └── model/
│       └── tourism_place.dart
├── assets/
│   ├── images/
│   │   ├── ranca_upas.jpg
│   │   ├── kawah_putih.jpg
│   │   ├── tangkuban_perahu.jpg
│   │   └── ulbi.jpg
│   └── fonts/
│       └── Staatliches-Regular.ttf
└── pubspec.yaml
```

**Penjelasan:**
- `lib/` berisi semua kode Dart
- `model/` berisi class model data
- `assets/` berisi file gambar dan font
- `pubspec.yaml` untuk konfigurasi dependencies dan assets

---

### LANGKAH 2: Konfigurasi pubspec.yaml

**2.1 Menambahkan Assets dan Fonts**

Edit file `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true
  
  # Konfigurasi assets
  assets:
    - assets/images/
  
  # Konfigurasi fonts
  fonts:
    - family: Staatliches
      fonts:
        - asset: assets/fonts/Staatliches-Regular.ttf
```

**Penjelasan:**
- `assets:` mendefinisikan folder yang berisi file asset
- `fonts:` mendefinisikan font custom dengan family name
- Setelah edit, jalankan `flutter pub get`

**2.2 Download Font dan Gambar**

1. Download font Staatliches dari https://fonts.google.com/specimen/Staatliches
2. Letakkan file `.ttf` di `assets/fonts/`
3. Siapkan gambar tempat wisata dan letakkan di `assets/images/`

---

### LANGKAH 3: Membuat Model Data

**3.1 Membuat Class TourismPlace**

File: `lib/model/tourism_place.dart`

```dart
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
```

**Penjelasan:**
- Class model untuk merepresentasikan data tempat wisata
- Menggunakan named parameters dengan `required`
- Semua properties bersifat mutable (bisa diubah)

**3.2 Membuat Data Statis**

Tambahkan di file yang sama:

```dart
var tourismPlaceList = [
  TourismPlace(
    name: 'Ranca Upas',
    location: 'Ciwidey, Bandung',
    description: 'Ranca Upas adalah kawasan bumi perkemahan...',
    openDays: 'Buka Setiap Hari',
    openTime: '24 Jam',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'assets/images/ranca_upas.jpg',
    imageUrls: [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
    ],
  ),
  // ... data lainnya
];
```

**Penjelasan:**
- List statis berisi data tempat wisata
- Bisa diakses dari file lain dengan import
- Data bisa diganti dengan data dari API di masa depan

---

### LANGKAH 4: Setup Main.dart

**4.1 Membuat Entry Point Aplikasi**

File: `lib/main.dart`

```dart
import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MainScreen(),
    );
  }
}
```

**Penjelasan:**
- `main()` adalah entry point aplikasi
- `runApp()` menjalankan aplikasi dengan widget root
- `MaterialApp` adalah wrapper untuk aplikasi Material Design
- `theme` mengatur tema global aplikasi
- `useMaterial3: false` menggunakan Material Design 2
- `home` menentukan halaman awal

---

### LANGKAH 5: Implementasi Navigation

**5.1 Membuat FirstScreen**

File: `lib/first_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
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
```

**Penjelasan:**
- `Navigator.push()` menambahkan halaman baru ke navigation stack
- `MaterialPageRoute` membuat route dengan animasi
- `builder` adalah function yang mengembalikan widget halaman baru
- `context` diperlukan untuk navigasi

**5.2 Membuat SecondScreen**

File: `lib/second_screen.dart`

```dart
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Kembali'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
```

**Penjelasan:**
- `Navigator.pop()` menghapus halaman dari stack
- Kembali ke halaman sebelumnya
- Konsep stack: Last In First Out (LIFO)

---

Laporan dilanjutkan di file terpisah karena panjang...
