# LAPORAN PRAKTIKUM PERTEMUAN 5 (Lanjutan)

---

## LANGKAH 6: Menampilkan Gambar

### 6.1 Gambar dari Internet (Image.network)

File: `lib/my_image.dart`

```dart
import 'package:flutter/material.dart';

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
```

**Penjelasan:**
- `Image.network()` memuat gambar dari URL
- Parameter `width` dan `height` mengatur ukuran gambar
- Memerlukan koneksi internet
- Gambar di-cache otomatis oleh Flutter

**Kelebihan:**
- Tidak menambah ukuran aplikasi
- Mudah diupdate tanpa rebuild aplikasi

**Kekurangan:**
- Memerlukan koneksi internet
- Loading time tergantung kecepatan internet

### 6.2 Gambar dari Asset (Image.asset)

File: `lib/my_image_asset.dart`

```dart
import 'package:flutter/material.dart';

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
```

**Penjelasan:**
- `Image.asset()` memuat gambar dari folder assets
- Path relatif dari root project
- Tidak memerlukan koneksi internet
- Gambar sudah bundled dalam aplikasi

**Kelebihan:**
- Cepat karena sudah ada di aplikasi
- Tidak perlu internet
- Konsisten di semua device

**Kekurangan:**
- Menambah ukuran aplikasi
- Perlu rebuild untuk update gambar

---

## LANGKAH 7: Implementasi ListView

### 7.1 Basic ListView

File: `lib/scrolling_screen.dart`

```dart
import 'package:flutter/material.dart';

class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrolling Screen'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text('1', style: TextStyle(fontSize: 50)),
            ),
          ),
          // ... item lainnya
        ],
      ),
    );
  }
}
```

**Penjelasan:**
- `ListView` membuat list yang bisa di-scroll
- `children` berisi list widget
- Semua item dibuat sekaligus
- Cocok untuk list pendek (< 20 item)

### 7.2 Dynamic List dengan map()

```dart
final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

body: ListView(
  children: numberList.map((number) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text('$number', style: const TextStyle(fontSize: 50)),
      ),
    );
  }).toList(),
),
```

**Penjelasan:**
- `.map()` mengubah setiap element list menjadi widget
- `.toList()` mengubah hasil map menjadi List
- Lebih dinamis dan maintainable
- Mudah untuk menambah/kurang item

### 7.3 ListView.builder

```dart
class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder'),
      ),
      body: ListView.builder(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}
```

**Penjelasan:**
- `itemCount` menentukan jumlah item
- `itemBuilder` dipanggil untuk setiap item
- Item dibuat secara lazy (on-demand)
- Lebih efisien untuk list panjang
- Hanya item yang terlihat yang di-render

**Keuntungan:**
- Performa lebih baik
- Memory usage lebih efisien
- Cocok untuk list dengan ribuan item

### 7.4 ListView.separated

```dart
class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
      ),
      body: ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            child: Center(
              child: Text('${numberList[index]}'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.red,
            thickness: 3,
          );
        },
      ),
    );
  }
}
```

**Penjelasan:**
- Seperti `ListView.builder`
- Menambahkan `separatorBuilder`
- Separator ditampilkan di antara item
- Cocok untuk list dengan divider/garis pemisah

---

## LANGKAH 8: Membuat Halaman Daftar Wisata

### 8.1 MainScreen - Daftar Tempat Wisata

File: `lib/main_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'model/tourism_place.dart';
import 'detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Bandung'),
      ),
      body: ListView.builder(
        itemCount: tourismPlaceList.length,
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(place: place),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        place.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                              const Icon(Icons.location_on, size: 16),
                              const SizedBox(width: 4),
                              Text(place.location),
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
```

**Penjelasan Komponen:**

1. **InkWell**
   - Memberikan efek ripple saat di-tap
   - `onTap` untuk handle klik
   - Navigasi ke DetailScreen dengan passing data

2. **Card**
   - Widget Material Design untuk kartu
   - `elevation` memberikan bayangan
   - `margin` untuk jarak antar card

3. **AspectRatio**
   - Menjaga rasio aspek gambar (16:9)
   - Gambar tidak terdistorsi
   - Konsisten di berbagai ukuran layar

4. **Expanded**
   - Membagi ruang secara proporsional
   - `flex: 1` untuk gambar (1/3 lebar)
   - `flex: 2` untuk info (2/3 lebar)

5. **Font Custom**
   - `fontFamily: 'Staatliches'` menggunakan font custom
   - Sudah dikonfigurasi di pubspec.yaml

---

## LANGKAH 9: Membuat Halaman Detail

### 9.1 DetailScreen - Detail Tempat Wisata

File: `lib/detail_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'model/tourism_place.dart';

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
              // Stack untuk gambar dengan tombol kembali
              Stack(
                children: <Widget>[
                  Image.asset(
                    place.imageAsset,
                    fit: BoxFit.cover,
                    height: 350,
                  ),
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
              // Informasi detail
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      place.name,
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Staatliches',
                      ),
                    ),
                    // ... komponen lainnya
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
```

**Penjelasan Komponen:**

1. **Constructor dengan Parameter**
   ```dart
   final TourismPlace place;
   const DetailScreen({super.key, required this.place});
   ```
   - Menerima data dari halaman sebelumnya
   - `required` memastikan data harus dikirim
   - Data bisa diakses dengan `place.name`, `place.location`, dll

2. **SafeArea**
   - Menghindari area sistem (notch, status bar)
   - Konten tidak tertutup UI sistem

3. **SingleChildScrollView**
   - Membuat konten bisa di-scroll
   - Penting untuk konten yang panjang
   - Mencegah overflow

4. **Stack**
   - Menumpuk widget satu di atas yang lain
   - Tombol kembali di atas gambar
   - Children dirender dari bawah ke atas

5. **CircleAvatar**
   - Membuat background bundar untuk icon
   - `backgroundColor` untuk warna background
   - Berisi IconButton untuk navigasi kembali

### 9.2 Galeri Gambar Horizontal

```dart
SizedBox(
  height: 150,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: place.imageUrls.map((url) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
  ),
)
```

**Penjelasan:**
- `scrollDirection: Axis.horizontal` untuk scroll horizontal
- `SizedBox` membatasi tinggi ListView
- `ClipRRect` untuk membuat sudut rounded
- `BorderRadius.circular(10)` untuk radius 10 pixel
- `.map()` mengubah list URL menjadi list widget

---

Laporan dilanjutkan...
