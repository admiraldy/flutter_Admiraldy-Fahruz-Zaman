# (15) Flutter State Management (Provider)

1. State merupakan data yang dapat berubah saat widget sedang aktif dan mempengaruhi tampilan UI (hanya dimiliki oleh statefullWidget)
2. Provider merupakan salah satu state management yang dapat digunakan secara lokal maupun global dalam aplikasi.
3. cara penggunaan provider:
   - Install package provider dalam pubspec.yaml
   - buat class yang mengelola state global dan gunakan _ChangeNotifier_ untuk memberikan notifikasi perubahan
   - wrap aplikasi dengan _ChangeNotifierProvider_ dan berikan instance dari class state global yang telah dibuat
   - gunakan _Provider.of< GLobalState >(context)_ untuk widget yang membutuhkan akses global
