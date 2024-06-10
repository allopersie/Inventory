import 'package:flutter/material.dart';

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
