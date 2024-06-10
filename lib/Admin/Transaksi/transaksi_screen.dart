import 'package:flutter/material.dart';
import 'order_screen.dart'; // import halaman formulir

class TransaksiScreen extends StatefulWidget {
  @override
  _TransaksiScreenState createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  List<String> _OrderList = []; // Menyimpan data yang dimasukkan dari FormScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        AppBar(
          title: Text(
            'Transaksi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ) ,/// Ubah judul AppBar
        actions: [
          IconButton(
            onPressed: () async {
              // Navigasi ke halaman formulir dan tunggu data yang dikirim kembali
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );

              // Periksa apakah ada data yang dikirim kembali
              if (result != null) {
                setState(() {
                  // Tambahkan data yang dikirim kembali ke dalam daftar
                  _OrderList.add(result);
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
          child: _OrderList.isEmpty
              ? Text(
            'Belum ada data',
            style: TextStyle(fontSize: 20),
          )
              : ListView.builder(
            itemCount: _OrderList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${_OrderList[index]}',
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
