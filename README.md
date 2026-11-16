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
Belum ada penggunaan AI untuk menulis code.