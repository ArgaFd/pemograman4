# Assets Fonts

Folder ini berisi font custom yang digunakan dalam aplikasi.

## Font yang Diperlukan:

1. **Staatliches-Regular.ttf** - Font Staatliches untuk judul dan teks penting

## Cara Menambahkan Font:

1. Download font Staatliches dari Google Fonts:
   - Kunjungi: https://fonts.google.com/specimen/Staatliches
   - Klik "Download family"
   - Extract file ZIP
   - Ambil file `Staatliches-Regular.ttf`

2. Letakkan file font di folder `assets/fonts/`

3. Font sudah dikonfigurasi di `pubspec.yaml`:
   ```yaml
   fonts:
     - family: Staatliches
       fonts:
         - asset: assets/fonts/Staatliches-Regular.ttf
   ```

## Penggunaan Font dalam Kode:

```dart
Text(
  'Teks dengan font Staatliches',
  style: TextStyle(
    fontFamily: 'Staatliches',
    fontSize: 24,
  ),
)
```
