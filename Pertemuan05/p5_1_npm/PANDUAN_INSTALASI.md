# 📖 PANDUAN INSTALASI DAN TESTING
## Proyek: p5_1_npm - Wisata Bandung

---

## 🎯 PRASYARAT

Sebelum memulai, pastikan Anda sudah menginstal:

1. **Flutter SDK** (versi 3.0+)
   - Download: https://flutter.dev/docs/get-started/install
   - Verifikasi: `flutter --version`

2. **IDE** (pilih salah satu)
   - Visual Studio Code + Flutter Extension
   - Android Studio + Flutter Plugin

3. **Emulator atau Physical Device**
   - Android Emulator (AVD)
   - iOS Simulator (Mac only)
   - Physical device dengan USB debugging enabled

4. **Git** (optional)
   - Untuk version control

---

## 📥 LANGKAH INSTALASI

### Step 1: Setup Proyek

```bash
# Masuk ke direktori proyek
cd c:\WEBBBB\flutter_project\Pertemuan05\p5_1_npm

# Install dependencies
flutter pub get
```

**Output yang diharapkan:**
```
Running "flutter pub get" in p5_1_npm...
Resolving dependencies...
Got dependencies!
```

### Step 2: Download dan Setup Font

1. **Download Font Staatliches**
   - Kunjungi: https://fonts.google.com/specimen/Staatliches
   - Klik tombol "Download family"
   - Extract file ZIP

2. **Copy Font ke Proyek**
   ```bash
   # Buat folder fonts jika belum ada
   mkdir -p assets/fonts
   
   # Copy file font
   # Letakkan file Staatliches-Regular.ttf ke assets/fonts/
   ```

3. **Verifikasi**
   - Pastikan file ada di: `assets/fonts/Staatliches-Regular.ttf`
   - Cek konfigurasi di `pubspec.yaml`

### Step 3: Setup Gambar

**Opsi A: Menggunakan Gambar Sendiri**

1. Siapkan 4 gambar:
   - `ranca_upas.jpg`
   - `kawah_putih.jpg`
   - `tangkuban_perahu.jpg`
   - `ulbi.jpg` (logo atau gambar apa saja)

2. Copy ke folder:
   ```bash
   # Letakkan semua gambar di:
   assets/images/
   ```

**Opsi B: Menggunakan Placeholder (Temporary)**

Edit file `lib/model/tourism_place.dart`, ubah `imageAsset` menjadi URL:

```dart
// Dari:
imageAsset: 'assets/images/ranca_upas.jpg',

// Menjadi:
imageAsset: 'https://picsum.photos/400/300?random=1',
```

Lalu ubah `Image.asset()` menjadi `Image.network()` di:
- `lib/main_screen.dart`
- `lib/detail_screen.dart`

### Step 4: Verifikasi Konfigurasi

```bash
# Check untuk masalah
flutter doctor

# Analyze kode
flutter analyze
```

**Output yang diharapkan:**
```
No issues found!
```

---

## ▶️ MENJALANKAN APLIKASI

### Method 1: Menggunakan Command Line

```bash
# List available devices
flutter devices

# Run di device tertentu
flutter run -d <device_id>

# Run di semua devices
flutter run
```

### Method 2: Menggunakan VS Code

1. Buka Command Palette (`Ctrl+Shift+P`)
2. Ketik "Flutter: Select Device"
3. Pilih device
4. Tekan `F5` atau klik "Run > Start Debugging"

### Method 3: Menggunakan Android Studio

1. Pilih device di toolbar
2. Klik tombol "Run" (▶️)
3. Atau tekan `Shift+F10`

---

## 🧪 TESTING APLIKASI

### Test Case 1: Halaman Utama

**Langkah:**
1. Jalankan aplikasi
2. Tunggu hingga halaman utama muncul

**Expected Result:**
- ✅ AppBar dengan judul "Wisata Bandung"
- ✅ List menampilkan 3 tempat wisata
- ✅ Setiap item menampilkan gambar dan nama
- ✅ Font Staatliches terlihat di nama tempat

### Test Case 2: Navigasi ke Detail

**Langkah:**
1. Tap pada salah satu item wisata
2. Tunggu halaman detail muncul

**Expected Result:**
- ✅ Halaman detail terbuka
- ✅ Gambar utama ditampilkan
- ✅ Tombol kembali muncul di pojok kiri atas
- ✅ Informasi lengkap ditampilkan
- ✅ Galeri gambar horizontal bisa di-scroll

### Test Case 3: Kembali ke Halaman Utama

**Langkah:**
1. Dari halaman detail, tap tombol kembali
2. Atau gunakan back button device

**Expected Result:**
- ✅ Kembali ke halaman utama
- ✅ List masih di posisi yang sama
- ✅ Tidak ada error

### Test Case 4: Scroll Vertikal

**Langkah:**
1. Di halaman utama, scroll ke bawah
2. Scroll ke atas

**Expected Result:**
- ✅ Scroll smooth tanpa lag
- ✅ Semua item terlihat
- ✅ Tidak ada overflow

### Test Case 5: Scroll Horizontal (Galeri)

**Langkah:**
1. Buka halaman detail
2. Scroll ke bawah hingga galeri
3. Swipe galeri ke kiri dan kanan

**Expected Result:**
- ✅ Galeri bisa di-scroll horizontal
- ✅ Gambar dari internet dimuat
- ✅ Jika gagal, tampil placeholder

### Test Case 6: Error Handling

**Langkah:**
1. Matikan internet
2. Buka halaman detail
3. Lihat galeri gambar

**Expected Result:**
- ✅ Placeholder icon muncul
- ✅ Aplikasi tidak crash
- ✅ Gambar asset tetap muncul

---

## 🐛 TROUBLESHOOTING

### Problem 1: "Unable to load asset"

**Penyebab:** Path gambar salah atau file tidak ada

**Solusi:**
```bash
# 1. Cek apakah file ada
ls assets/images/

# 2. Cek pubspec.yaml
# Pastikan ada:
# assets:
#   - assets/images/

# 3. Restart aplikasi
flutter clean
flutter pub get
flutter run
```

### Problem 2: Font tidak berubah

**Penyebab:** Font belum di-load atau konfigurasi salah

**Solusi:**
```bash
# 1. Cek file font ada
ls assets/fonts/

# 2. Cek pubspec.yaml
# Pastikan ada:
# fonts:
#   - family: Staatliches
#     fonts:
#       - asset: assets/fonts/Staatliches-Regular.ttf

# 3. Hot restart (bukan hot reload)
# Tekan 'R' di terminal atau restart aplikasi
```

### Problem 3: "Failed to load network image"

**Penyebab:** Tidak ada koneksi internet atau URL salah

**Solusi:**
- Pastikan device terhubung internet
- Cek URL gambar valid
- Error handling sudah ada, seharusnya tampil placeholder

### Problem 4: Build failed

**Penyebab:** Dependencies tidak terinstall atau cache corrupt

**Solusi:**
```bash
flutter clean
flutter pub get
flutter pub upgrade
flutter run
```

### Problem 5: Gradle build error (Android)

**Solusi:**
```bash
# Update Gradle wrapper
cd android
./gradlew wrapper --gradle-version 7.5

# Atau edit android/gradle/wrapper/gradle-wrapper.properties
# distributionUrl=https\://services.gradle.org/distributions/gradle-7.5-all.zip
```

---

## 🔧 KONFIGURASI TAMBAHAN

### Hot Reload vs Hot Restart

**Hot Reload (r):**
- Cepat
- Mempertahankan state
- Untuk perubahan UI

**Hot Restart (R):**
- Lebih lambat
- Reset state
- Untuk perubahan struktur/assets

### Debug Mode vs Release Mode

```bash
# Debug mode (default)
flutter run

# Release mode (lebih cepat)
flutter run --release

# Profile mode (untuk performance testing)
flutter run --profile
```

---

## 📊 PERFORMANCE TIPS

### 1. Optimasi Gambar

```bash
# Compress gambar sebelum digunakan
# Ukuran ideal: < 500KB per gambar
# Resolusi: 800x600 - 1920x1080
```

### 2. Build APK untuk Testing

```bash
# Build APK
flutter build apk

# APK ada di:
# build/app/outputs/flutter-apk/app-release.apk

# Install ke device
adb install build/app/outputs/flutter-apk/app-release.apk
```

### 3. Analyze Performance

```bash
# Check performance
flutter run --profile

# Buka DevTools
flutter pub global activate devtools
flutter pub global run devtools
```

---

## 📱 TESTING DI BERBAGAI DEVICE

### Android

```bash
# List Android devices
adb devices

# Run di device spesifik
flutter run -d <device_id>

# Install APK manual
adb install app-release.apk
```

### iOS (Mac only)

```bash
# List iOS devices
flutter devices

# Run di simulator
flutter run -d "iPhone 14"

# Run di physical device
flutter run -d <device_id>
```

---

## ✅ CHECKLIST SEBELUM SUBMIT

- [ ] Semua file ada (8 file .dart)
- [ ] Assets lengkap (4 gambar + 1 font)
- [ ] `pubspec.yaml` sudah dikonfigurasi
- [ ] `flutter pub get` berhasil
- [ ] `flutter analyze` tidak ada error
- [ ] Aplikasi bisa di-run
- [ ] Semua fitur berfungsi
- [ ] Navigasi lancar
- [ ] Gambar tampil
- [ ] Font custom terlihat
- [ ] Scroll smooth
- [ ] Error handling bekerja
- [ ] Kode sudah di-comment
- [ ] README.md lengkap

---

## 📞 BANTUAN

Jika masih ada masalah:

1. **Check Flutter Doctor**
   ```bash
   flutter doctor -v
   ```

2. **Check Logs**
   ```bash
   flutter logs
   ```

3. **Clean dan Rebuild**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

4. **Restart IDE**
   - Close dan buka kembali VS Code/Android Studio

5. **Restart Device**
   - Restart emulator atau physical device

---

## 🎓 LEARNING RESOURCES

- **Flutter Documentation:** https://docs.flutter.dev/
- **Flutter Cookbook:** https://docs.flutter.dev/cookbook
- **Flutter Widget Catalog:** https://docs.flutter.dev/development/ui/widgets
- **Dart Language Tour:** https://dart.dev/guides/language/language-tour

---

**Good luck! 🚀**
