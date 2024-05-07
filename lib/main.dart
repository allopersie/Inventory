import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import HomeScreen
import 'produk_screen.dart'; // Import ProdukScreen
import 'transaksi_screen.dart'; // Import TransaksiScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Color(0xFF11144c),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: Color(0xFFF8F9FA), // Ubah warna latar belakang
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFF8F9FA), // Ubah warna latar belakang AppBar
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w100,
            fontSize: 20,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex = 0;
  List<Widget> widgetList = [
    HomeScreen(), // Gunakan HomeScreen
    ProdukScreen(), // Gunakan ProdukScreen
    TransaksiScreen(), // Gunakan TransaksiScreen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Inventory Produk',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFFa0a0a0),
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              'Konveksi Kaos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
        centerTitle: true, // Atur agar teks berada di tengah
      ),
      body: widgetList[myIndex], // Tampilkan widget berdasarkan myIndex
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey, // Warna ikon tidak aktif
        selectedItemColor: Color(0xFF5b9ee1), // Warna ikon aktif
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_outlined),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vert_rounded),
            label: 'Transaksi',
          ),
        ],
      ),
    );
  }
}
