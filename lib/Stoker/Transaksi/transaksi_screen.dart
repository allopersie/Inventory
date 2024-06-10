import 'package:flutter/material.dart';

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
