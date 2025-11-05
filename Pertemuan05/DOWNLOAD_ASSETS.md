# 📥 PANDUAN DOWNLOAD ASSETS
## Font dan Gambar untuk Proyek p5_1_npm

---

## 🎯 ASSETS YANG DIPERLUKAN

Proyek ini memerlukan:
- **1 Font Custom:** Staatliches
- **4 Gambar:** Tempat wisata Bandung

---

## 🔤 DOWNLOAD FONT

### Font: Staatliches

**Sumber:** Google Fonts

**Langkah Download:**

1. **Kunjungi Google Fonts**
   ```
   https://fonts.google.com/specimen/Staatliches
   ```

2. **Download Font**
   - Klik tombol "Download family" di pojok kanan atas
   - File ZIP akan terdownload

3. **Extract File**
   - Extract file `Staatliches.zip`
   - Cari file `Staatliches-Regular.ttf`

4. **Copy ke Proyek**
   ```bash
   # Copy file ke:
   c:\WEBBBB\flutter_project\Pertemuan05\p5_1_npm\assets\fonts\Staatliches-Regular.ttf
   ```

5. **Verifikasi**
   - Pastikan nama file: `Staatliches-Regular.ttf` (case-sensitive)
   - Lokasi: `assets/fonts/`

---

## 🖼️ DOWNLOAD GAMBAR

### Gambar 1: Ranca Upas

**Nama File:** `ranca_upas.jpg`

**Sumber Rekomendasi:**
1. **Google Images**
   - Search: "Ranca Upas Bandung"
   - Filter: Tools > Usage rights > Creative Commons licenses
   
2. **Unsplash**
   - https://unsplash.com/s/photos/ranca-upas
   
3. **Pexels**
   - https://www.pexels.com/search/ranca%20upas/

**Spesifikasi:**
- Format: JPG
- Resolusi: Minimal 800x600px
- Ukuran: Maksimal 500KB

**Lokasi:** `assets/images/ranca_upas.jpg`

---

### Gambar 2: Kawah Putih

**Nama File:** `kawah_putih.jpg`

**Sumber Rekomendasi:**
1. **Google Images**
   - Search: "Kawah Putih Bandung"
   - Filter: Creative Commons
   
2. **Unsplash**
   - https://unsplash.com/s/photos/kawah-putih
   
3. **Pixabay**
   - https://pixabay.com/images/search/kawah%20putih/

**Spesifikasi:**
- Format: JPG
- Resolusi: Minimal 800x600px
- Ukuran: Maksimal 500KB

**Lokasi:** `assets/images/kawah_putih.jpg`

---

### Gambar 3: Tangkuban Perahu

**Nama File:** `tangkuban_perahu.jpg`

**Sumber Rekomendasi:**
1. **Google Images**
   - Search: "Tangkuban Perahu"
   - Filter: Creative Commons
   
2. **Unsplash**
   - https://unsplash.com/s/photos/tangkuban-perahu
   
3. **Wikimedia Commons**
   - https://commons.wikimedia.org/wiki/Category:Tangkuban_Perahu

**Spesifikasi:**
- Format: JPG
- Resolusi: Minimal 800x600px
- Ukuran: Maksimal 500KB

**Lokasi:** `assets/images/tangkuban_perahu.jpg`

---

### Gambar 4: ULBI Logo

**Nama File:** `ulbi.jpg`

**Sumber:**
- Logo resmi ULBI
- Atau gambar placeholder apa saja

**Alternatif:**
Jika tidak punya logo ULBI, gunakan gambar apa saja dengan nama `ulbi.jpg`

**Spesifikasi:**
- Format: JPG atau PNG (rename ke .jpg)
- Resolusi: Minimal 400x400px
- Ukuran: Maksimal 300KB

**Lokasi:** `assets/images/ulbi.jpg`

---

## 🛠️ CARA SETUP ASSETS

### Step-by-Step

1. **Buat Folder Assets** (jika belum ada)
   ```bash
   cd c:\WEBBBB\flutter_project\Pertemuan05\p5_1_npm
   mkdir assets\images
   mkdir assets\fonts
   ```

2. **Download Semua Assets**
   - Font Staatliches dari Google Fonts
   - 4 gambar wisata dari sumber yang disebutkan

3. **Rename File Gambar**
   Pastikan nama file sesuai:
   - `ranca_upas.jpg`
   - `kawah_putih.jpg`
   - `tangkuban_perahu.jpg`
   - `ulbi.jpg`

4. **Copy ke Folder yang Tepat**
   ```
   assets/
   ├── fonts/
   │   └── Staatliches-Regular.ttf
   └── images/
       ├── ranca_upas.jpg
       ├── kawah_putih.jpg
       ├── tangkuban_perahu.jpg
       └── ulbi.jpg
   ```

5. **Verifikasi**
   ```bash
   # Check apakah semua file ada
   dir assets\fonts
   dir assets\images
   ```

6. **Run Flutter Pub Get**
   ```bash
   flutter pub get
   ```

7. **Run Aplikasi**
   ```bash
   flutter run
   ```

---

## 🎨 OPTIMASI GAMBAR

### Menggunakan Online Tools

**TinyPNG** (Recommended)
- URL: https://tinypng.com/
- Upload gambar
- Download hasil compress
- Ukuran berkurang 50-70%

**Squoosh**
- URL: https://squoosh.app/
- Lebih banyak opsi
- Bisa atur quality

**ImageOptim** (Mac)
- Desktop app
- Drag and drop
- Otomatis optimize

### Menggunakan Command Line

**ImageMagick:**
```bash
# Install ImageMagick dulu
# Windows: https://imagemagick.org/script/download.php

# Resize dan compress
magick convert input.jpg -resize 1920x1080 -quality 85 output.jpg
```

**Pillow (Python):**
```python
from PIL import Image

img = Image.open('input.jpg')
img = img.resize((1920, 1080), Image.LANCZOS)
img.save('output.jpg', quality=85, optimize=True)
```

---

## 🔄 ALTERNATIF: MENGGUNAKAN PLACEHOLDER

Jika kesulitan download gambar, gunakan placeholder sementara:

### Opsi 1: Placeholder Online

Edit `lib/model/tourism_place.dart`:

```dart
var tourismPlaceList = [
  TourismPlace(
    name: 'Ranca Upas',
    // ... data lainnya
    imageAsset: 'https://picsum.photos/400/300?random=1',
    // ...
  ),
];
```

Lalu ubah `Image.asset()` menjadi `Image.network()` di:
- `lib/main_screen.dart`
- `lib/detail_screen.dart`

### Opsi 2: Gambar Solid Color

Buat gambar solid color dengan tool online:
- https://dummyimage.com/400x300/cccccc/000000.jpg&text=Ranca+Upas

Download dan rename sesuai kebutuhan.

---

## ✅ CHECKLIST DOWNLOAD

Gunakan checklist ini untuk memastikan semua assets sudah lengkap:

### Font
- [ ] Download Staatliches.zip dari Google Fonts
- [ ] Extract file ZIP
- [ ] Copy `Staatliches-Regular.ttf` ke `assets/fonts/`
- [ ] Verifikasi nama file benar

### Gambar
- [ ] Download gambar Ranca Upas
- [ ] Rename menjadi `ranca_upas.jpg`
- [ ] Copy ke `assets/images/`
- [ ] Download gambar Kawah Putih
- [ ] Rename menjadi `kawah_putih.jpg`
- [ ] Copy ke `assets/images/`
- [ ] Download gambar Tangkuban Perahu
- [ ] Rename menjadi `tangkuban_perahu.jpg`
- [ ] Copy ke `assets/images/`
- [ ] Download/siapkan gambar ULBI
- [ ] Rename menjadi `ulbi.jpg`
- [ ] Copy ke `assets/images/`

### Verifikasi
- [ ] Semua file ada di folder yang benar
- [ ] Nama file sesuai (case-sensitive)
- [ ] Ukuran file tidak terlalu besar (< 500KB)
- [ ] Format file benar (.ttf untuk font, .jpg untuk gambar)

### Testing
- [ ] Jalankan `flutter pub get`
- [ ] Jalankan `flutter run`
- [ ] Cek apakah gambar tampil
- [ ] Cek apakah font berubah
- [ ] Tidak ada error di console

---

## 🐛 TROUBLESHOOTING

### Problem: "Unable to load asset"

**Kemungkinan Penyebab:**
1. File tidak ada di folder
2. Nama file salah (typo atau case)
3. Path di pubspec.yaml salah

**Solusi:**
```bash
# 1. Cek apakah file ada
dir assets\images
dir assets\fonts

# 2. Cek nama file (harus exact match)
# Nama file harus:
# - ranca_upas.jpg (bukan Ranca_Upas.jpg)
# - kawah_putih.jpg (bukan kawah-putih.jpg)
# - tangkuban_perahu.jpg
# - ulbi.jpg
# - Staatliches-Regular.ttf

# 3. Restart aplikasi
flutter clean
flutter pub get
flutter run
```

### Problem: Font tidak berubah

**Solusi:**
1. Pastikan file font ada di `assets/fonts/`
2. Cek `pubspec.yaml` sudah benar
3. Hot restart (bukan hot reload)
4. Jika masih tidak berubah, restart IDE

### Problem: Gambar terlalu besar

**Solusi:**
1. Compress gambar dengan TinyPNG
2. Atau resize dengan ImageMagick
3. Target ukuran: < 500KB per gambar

---

## 📞 BANTUAN

Jika masih ada masalah:

1. **Cek Dokumentasi**
   - Baca `PANDUAN_INSTALASI.md`
   - Lihat `RINGKASAN_PROYEK.md`

2. **Cek Flutter**
   ```bash
   flutter doctor
   flutter analyze
   ```

3. **Cek Logs**
   ```bash
   flutter logs
   ```

4. **Clean dan Rebuild**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

---

## 📚 RESOURCES

### Font
- **Google Fonts:** https://fonts.google.com/
- **Font Squirrel:** https://www.fontsquirrel.com/

### Gambar Free
- **Unsplash:** https://unsplash.com/
- **Pexels:** https://www.pexels.com/
- **Pixabay:** https://pixabay.com/
- **Wikimedia Commons:** https://commons.wikimedia.org/

### Image Optimization
- **TinyPNG:** https://tinypng.com/
- **Squoosh:** https://squoosh.app/
- **Compressor.io:** https://compressor.io/

---

## 🎉 SELESAI!

Setelah semua assets di-download dan di-setup:

1. ✅ Font Staatliches ada di `assets/fonts/`
2. ✅ 4 gambar ada di `assets/images/`
3. ✅ Nama file sesuai
4. ✅ `flutter pub get` berhasil
5. ✅ Aplikasi bisa di-run

**Next:** Jalankan `flutter run` dan nikmati aplikasi Wisata Bandung! 🚀

---

**Happy Coding! 💻**
