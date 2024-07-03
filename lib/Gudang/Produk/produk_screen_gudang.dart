import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../Admin/Produk/form_screen.dart';
import '../../App_Constant/AppConstant.dart';
import '../../Model/User_Model.dart';
import 'package:http/http.dart' as http;

class ProdukScreenGudang extends StatefulWidget {
  @override
  _ProdukScreenGudangState createState() => _ProdukScreenGudangState();
}

class _ProdukScreenGudangState extends State<ProdukScreenGudang> {
  //List<String> _ProdukList = []; // Menyimpan data yang dimasukkan dari FormScreen
  Future<List<ProdukModelVW>> getPesananApi() async{

    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.ProdukView)) ;
      //final body = json.decode(response.body) as List;
      print(response.body);
      if(response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return ProdukModelVW.listFromJson(data);
        //setState(() {
        //for(Map<String,dynamic> i in data){
        //pesanans.add(PesananModel.fromJson(i));
        //}

        // bahans = data.map((String,dynamic) => BahanModel.fromJson(dynamic))
        //});

      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');

  }
  @override
  void initState(){
    super.initState();
    getPesananApi();
  }
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

        ],
      ),
      body: FutureBuilder<List<ProdukModelVW>>(
        future: getPesananApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  //title: Text(user.Warna),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tanggal: ${user.Tanggal}'),
                      Text('Warna: ${user.Warna}'),
                      Text('Jenis Bahan: ${user.Nama_Bahan}'),
                      Text('Ukuran: ${user.Ukuran}'),
                      Text('Quantity: ${user.Quantity.toString()}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),

    );
  }
}
