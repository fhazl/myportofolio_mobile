### Tugas 7

1. Representasi tampilan UI dalam aplikasi berbentuk tree
2. MyHomePage: Custom widget untuk menyimpan halaman homepage
InfoCard: Custom widget Card yang berfungsi untuk menampilkan data
ItemCard: Custom widget Material yang menyimpan informasi tombol 'item'
Stateless widget: widget immutable
Scaffold: widget yang mengatur struktur sebuah aplikasi
AppBar: widget untuk header aplikasi
SizedBox: widget kotak
Center: widget container utk meletakan childnya ditengah
Column: widget container utk array child vertikal 
Row: widget container utk array child horizontal 
Container: widget yang mengatur tampilan, posisi dan ukuran.
Text: widget menyimpan text
TextStyle: menyimpan format text
Card: Material dengan sudut tumpul dan bayangan
Icon: menyimpan ikon/simbol
InkWell: material persegi yang dapat berinteraksi dengan user
Material: widget yang mengatur elevasi, clipping dan ink effects
Expanded: widget yang membuat child Row, Column, Flex mengisi seluruh space kosong
Padding: widget yang menambahkan space kosong
GridView.count
3. MaterialApp adalah sebuah widget yang menjadi wrapper semua UI flutter. Widget ini cukup penting karena mengendalikan routing aplikasi, membungkus widget material lainnya, dan membantu dalam pembuatan aplikasi yang cantik.
4. Perbedaannya terletak pada mutabilitas suatu widget. Stateless widget adalah widget yang tidak bisa diubah setelah di-build. Kebalikannya, stateful widget adalah widget yang dapat diubah setelah di-build. Stateless widget berguna untuk UI yang tidak dipengaruhi oleh hal lain, kecuali konfigurasi widget dan BuildContext. Contoh: Judul sebuah video yang muncul di FYP atau nama produk di marketplace. Sedangkan, stateful widget digunakan ketika UInya harus berubah secara dinamis seperti textbox dalam sebuah formulir.
5. BuildContext menjelaskan lokasi sebuah widget pada tree relatif terhadap anak dan parentnya. Hal ini digunakan pada metode build untuk membantu sebuah widget berubah sesuai kondisi parent dan childnya.
6. Hot reload adalah command bawaan flutter yang berfungsi untuk membuat dan memperbaiki UIdengan cepat. Perbedaannya dengan hot restart adalah status aplikasinya. Ketika melakukan hot reload, aplikasinya akan menyimpan data sebelum hot reload. Sedangkan, hot restart menghapus data sebelumnya dan mengembalikan aplikasi ke kondisi awal. Hot reload hanya berguna ketika mengubah UI sebuah aplikasi dan hanya mengupdate build. Hot reload tidak bisa mengubah logika aplikasi seperti pengubahan konstruktor dan penambahan fitur baru.

### Tugas 8
1. Navigator.push() vs Navigator.pushReplacement() vs Navigator.pop():
push(): Menambah halaman baru di atas stack (bisa kembali ke halaman sebelumnya).
pushReplacement(): Mengganti halaman aktif di stack (tidak bisa kembali ke halaman yang diganti).
pop(): Menutup halaman teratas dan kembali ke halaman sebelumnya.
Buka formulir dari kartu aksi: Pakai Navigator.push() agar pengguna bisa kembali/batal dengan pop().
Opsi Home di drawer ke halaman utama: Tutup drawer lalu navigasi ke halaman utama (misalnya pushReplacement() / pushAndRemoveUntil() agar stack tidak menumpuk, atau ubah state/tab aktif).
2. Scaffold, AppBar, dan Drawer:
Menjaga tata letak kerangka halaman, header, dan menu samping tetap seragam antarlayar.
Contoh warna tema portofolio: Warna utama (misal biru tua) dipakai konsisten di AppBar halaman homepage, halaman proyek, serta tombol Simpan pada formulir lewat ThemeData/ColorScheme.
3. Tata letak formulir, pengatur jarak, dan penggulir:
Tata letak vertikal (Column) mudah dipindai, rapi di layar sempit, dan memberi ruang pesan error.
Pengatur jarak (SizedBox/Padding): Menjaga jarak antar-field dan tombol agar tidak saling menempel/bertabrakan.
Scroller (SingleChildScrollView/ListView): Mencegah overflow saat layar kecil atau keyboard muncul, serta memungkinkan akses ke field bawah/tombol Simpan.
4. GlobalKey<FormState>, validator, dan validate():
GlobalKey<FormState>: Mengakses FormState dari luar Form (misal saat tombol Simpan ditekan).
validator: Mengecek isi field dan mengembalikan pesan error jika tidak valid, atau null jika valid.
validate(): Menjalankan semua validator di Form dan mengembalikan true jika semua lolos.
Contoh nilai ditolak adalah URL tanpa format valid (misal "portofolio-saya") atau field wajib kosong.
keyboardType saja tidak cukup karena keyboardType hanya mengatur tampilan keyboard, pengguna masih bisa paste/mengetik input tidak sesuai aturan atau mengosongkan field.

### Referensi
* [Flutter Stateful vs Stateless Widgets (GeeksforGeeks)] [https://www.geeksforgeeks.org/flutter/flutter-stateful-vs-stateless-widgets/]
* [Material App Class in Flutter (GeeksforGeeks)] [https://www.geeksforgeeks.org/flutter/materialapp-class-in-flutter/]
* [Dart Builder Class (GeeksforGeeks)] [https://www.geeksforgeeks.org/dart/dart-builder-class/]
* [Difference Between Hot Reload and Hot Restart in Flutter (GeeksforGeeks)] [https://www.geeksforgeeks.org/flutter/difference-between-hot-reload-and-hot-restart-in-flutter/]
* [Flutter Scaffold Explained (FlutterSensei)] [https://fluttersensei.com/blog/flutter-scaffold-explained]
* [Flutter Widgets Sizedbox vs Container (Medium)] [https://medium.com/@olasoji.od/flutter-widgets-sizedbox-vs-container-7d9cf3e566f7]
* [Card Class (Flutter)] [https://api.flutter.dev/flutter/material/Card-class.html]
* [InkWell Class (Flutter)] [https://api.flutter.dev/flutter/material/InkWell-class.html]
* [Material Class (Flutter)] [https://api.flutter.dev/flutter/material/Material-class.html]
* [Expanded Class (Flutter)] [https://api.flutter.dev/flutter/widgets/Expanded-class.html]

### AI Disclosure
Tugas 7
Belum ada penggunaan AI untuk menulis code.

Tugas 8
Kelebihan:
Cepat bikin boilerplate & UI
Berguna merancangaturan validasi (spasi saja, panjang, URL, urutan tanggal) dan tata letak anti-overflow saat keyboard muncul.
Mempercepat debugging & flutter analyze ketika muncul error.

Kekurangan Pakai AI
AI bisa memakai widget atau nama field yang terlalu berlebihan atau kurang sesuai dengan pilihan pribadi.
Jika langsung copy-paste tanpa membaca alur Navigator, FormState, dan state, akan menyulitkan saat debugging.