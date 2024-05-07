import 'package:flutter/material.dart';
import 'form_screen.dart'; // Import halaman formulir

class ProdukScreen extends StatefulWidget {
  @override
  _ProdukScreenState createState() => _ProdukScreenState();
}

class _ProdukScreenState extends State<ProdukScreen> {
  List<String> _ProdukList = []; // Menyimpan data yang dimasukkan dari FormScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        AppBar(
          title: Text(
            'Produk',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ) ,// Ubah judul AppBar
        actions: [
          IconButton(
            onPressed: () async {
              // Navigasi ke halaman formulir dan tunggu data yang dikirim kembali
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormScreen()),
              );

              // Periksa apakah ada data yang dikirim kembali
              if (result != null) {
                setState(() {
                  // Tambahkan data yang dikirim kembali ke dalam daftar
                  _ProdukList.add(result);
                });
              }
            },
            icon: Icon(Icons.add),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.0), // Tambahkan jarak atas
        child: Center(
          child: _ProdukList.isEmpty
              ? Text(
            'Belum ada data',
            style: TextStyle(fontSize: 20),
          )
              : ListView.builder(
            itemCount: _ProdukList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${_ProdukList[index]}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
