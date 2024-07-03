import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Gudang/Produk/produk_screen_gudang.dart';
import 'Gudang/Transaksi/transaksi_screen_gudang.dart';
import 'LoginScreen.dart';
import 'Stoker/Produk/produk_screen_stoker.dart';
import 'Stoker/Transaksi/transaksi_screen_stoker.dart';
import 'home_screen.dart';
import 'Admin/Produk/produk_screen.dart';
import 'Admin/Transaksi/transaksi_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBWqpZCcT-OO4WS8Ok_qYtV6XgtkBjZOeQ",
            authDomain: "fire-setup-eeef6.firebaseapp.com",
            projectId: "fire-setup-eeef6",
            storageBucket: "fire-setup-eeef6.appspot.com",
            messagingSenderId: "134802871590",
            appId: "1:134802871590:web:4fcb5f28790483fbc6dde7"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Colors.white,
        //colorScheme: ColorScheme.fromSwatch().copyWith(
          //surface: Colors.white, // Menggunakan surface sebagai pengganti background
        //),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // Menggunakan surface sebagai pengganti background AppBar
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w100,
            fontSize: 20,
          ),
        ),
      ),
      home: LoginScreen(), // Tampilkan LoginScreen sebagai layar awal
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String role;
  MyHomePage({required this.role});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex = 0;


  List<Widget> _adminPages = [
    Center(child: Text('Admin Dashboard')),
    Center(child: Text('Admin Settings')),
  ];

  List<Widget> _userPages = [
    Center(child: Text('User Dashboard')),
    Center(child: Text('User Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages;
    List<BottomNavigationBarItem> items;

    List<Widget> _gudang = [
      HomeScreen(role: widget.role), // Gunakan HomeScreen
      ProdukScreenGudang(), // Gunakan ProdukScreen
      TransaksiScreenGudang(),
    ];
    List<Widget> _stoker = [
      HomeScreen(role: widget.role), // Gunakan HomeScreen
      ProdukScreenStoker(), // Gunakan ProdukScreen
      TransaksiScreenStoker(),
    ];

    List<Widget> widgetList = [
      HomeScreen(role: widget.role), // Gunakan HomeScreen
      ProdukScreen(role: widget.role), // Gunakan ProdukScreen
      TransaksiScreen(role: widget.role), // Gunakan TransaksiScreen
    ];

    switch (widget.role) {
      case 'admin':
        pages = widgetList;
        items = [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.local_grocery_store_outlined), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_vert_rounded), label: 'Transaksi'),
        ];
        break;
      case 'gudang':
        pages = _gudang;
        items = [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.local_grocery_store_outlined), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_vert_rounded), label: 'Transaksi'),
        ];
        break;
      case 'stoker':
      default:
        pages = _stoker;
        items = [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.local_grocery_store_outlined), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_vert_rounded), label: 'Transaksi'),
        ];
        break;
    }
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
              'Konveksi Kaos Massal',
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
      body: pages[myIndex], // Tampilkan widget berdasarkan myIndex

    bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        items: items,
        onTap: (index) {
        setState(() {
          myIndex = index;
        });
        },
    ),

    );
  }
}
