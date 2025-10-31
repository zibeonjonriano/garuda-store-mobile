# garuda_store

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# Tugas 7: Elemen Dasar Flutter
---
## 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

'''Widget Tree adalah representasi logis hierarkis dari seluruh antarmuka pengguna (UI) aplikasi Flutter yang saya buat. Seluruh UI saya tersusun dari widget dalam struktur pohon, di mana setiap widget adalah simpul (node). Hubungan parent-child (induk-anak) bekerja karena widget yang berada di level atas (induk) memiliki kontrol terhadap posisi, ukuran, dan konfigurasi widget di bawahnya (anak). Pohon ini dihitung selama proses layout (pengukuran) dan kemudian digunakan saat rendering (menampilkan ke layar) serta hit testing (interaksi sentuhan). Setiap kali state (keadaan) suatu widget berubah, widget tersebut dan widget anak yang terpengaruh akan dibangun ulang (rebuilt).'''

## 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

'''Dalam kode yang saya gunakan untuk aplikasi "Garuda Store", beberapa widget utama adalah: StatelessWidget (sebagai basis untuk MyHomePage, ItemCard, dan InfoCard karena tidak memiliki state yang berubah secara internal), Scaffold (menyediakan kerangka dasar halaman Material Design dengan AppBar dan body), AppBar (bilah atas halaman yang menampilkan judul), Text (menampilkan teks), Icon (menampilkan ikon), Padding (memberikan jarak di sekitar widget anak), Column (menyusun widget secara vertikal), Row (menyusun widget secara horizontal), SizedBox (memberi jarak kosong/spasi), Center (memposisikan widget anak di tengah), Card (kartu dengan bayangan yang membungkus InfoCard), Material (memberi warna latar belakang dan sudut melengkung pada ItemCard), InkWell (menambahkan efek sentuhan dan menangani aksi onTap), dan GridView.count (menyusun ItemCard dalam bentuk grid).'''

## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

'''MaterialApp adalah widget yang menjadi dasar dari aplikasi yang mengikuti pedoman Material Design. Biasanya digunakan sebagai widget root karena ia menyediakan fungsionalitas dan konfigurasi global yang penting untuk seluruh aplikasi, seperti:
1. Sistem Perutean (Routing) untuk navigasi antar layar.
2. Theming untuk menentukan skema warna dan gaya teks global yang dapat diwariskan ke semua widget di bawahnya. Dengan menjadi root, MaterialApp memastikan bahwa semua widget di Widget Tree memiliki akses ke layanan framework dan definisi desain Material Design yang konsisten.'''

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

'''Perbedaan mendasar antara keduanya adalah pada kemampuan pengelolaan state (keadaan). StatelessWidget adalah widget yang tidak memiliki state internal yang berubah; propertinya bersifat final dan tampilannya hanya bergantung pada input data dari widget induknya. Saya memilih StatelessWidget untuk elemen yang statis, seperti menampilkan teks atau ikon. Sebaliknya, StatefulWidget adalah widget yang dapat berubah secara dinamis selama masa pakainya karena memiliki kelas State pendamping yang mengelola data yang berubah. StatefulWidget dipilih ketika widget tersebut perlu merespons interaksi pengguna atau mengubah tampilannya berdasarkan state internal, seperti tombol counter atau checkbox.'''

## 5.  Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

'''BuildContext adalah referensi ke lokasi widget di dalam Widget Tree; bisa dibilang ini adalah "alamat" dari widget saya. Ini sangat penting karena memungkinkan widget untuk:
1. Mengakses Data Pewarisan: Saya menggunakannya untuk mencari dan mengakses data atau layanan dari widget leluhur (ancestor) yang ada di atasnya, seperti mengakses tema menggunakan Theme.of(context).
2. Berinteraksi dengan Layanan: Saya menggunakannya untuk layanan framework seperti Navigator untuk navigasi atau ScaffoldMessenger untuk menampilkan SnackBar. Setiap widget mewajibkan adanya BuildContext context sebagai parameter di metode build (Widget build(BuildContext context)) karena ini adalah titik awal bagi widget saya untuk menemukan semua layanan yang dibutuhkan dan menentukan tempat widget tersebut akan disisipkan di UI.'''

## 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

'''Hot Reload adalah fitur unggulan Flutter di mana saya dapat melihat hasil perubahan kode secara instan tanpa perlu mengkompilasi ulang seluruh aplikasi. Ketika saya melakukan Hot Reload, perubahan kode hanya dimuat ke dalam Dart VM dan hanya Widget Tree yang dibangun ulang, sehingga state aplikasi tetap dipertahankan; fungsi main() atau initState() tidak dijalankan kembali. Ini ideal untuk penyesuaian UI yang cepat. Sementara itu, Hot Restart memuat perubahan kode ke dalam VM dan kemudian me-restart aplikasi Flutter secara keseluruhan, yang menyebabkan state aplikasi hilang karena fungsi main() dan initState() dijalankan kembali. Hot Restart digunakan ketika ada perubahan kode yang memengaruhi state global atau logika non-UI.'''
