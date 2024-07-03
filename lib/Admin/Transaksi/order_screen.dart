import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../App_Constant/AppConstant.dart';
import '../../Model/User_Model.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Future<List<ProdukModel>> getProdukApi() async{
    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.PRODUK)) ;
      //final body = json.decode(response.body) as List;
      print(response.body);
      if(response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return ProdukModel.listFromJson(data);
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');
  }

  Future<List<BahanModel>> getBahanApi() async{
    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.BAHAN)) ;
      //final body = json.decode(response.body) as List;
      print(response.body);
      if(response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return BahanModel.listFromJson(data);
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');
  }

  Future<List<UkuranModel>> getUkuranApi ()async{

    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.UKURAN)) ;
      final body = json.decode(response.body) as List;
      if(response.statusCode == 200) {
        print(response.body);
        if(response.statusCode == 200) {
          List data = jsonDecode(response.body);
          return UkuranModel.listFromJson(data);
        }
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');
  }
  void postToPesanan() async{
    PesananModel model = PesananModel(ID: "",Tanggal: selectedDate.toString(),
        Warna: _selectedColor, Jenis_Bahan_ID: int.parse(_selectedMaterial!),
        Ukuran_ID: int.parse(_selectedSize!), Quantity: int.parse(_quantityController.text),
        Created: DateTime.now().toString(), Createdby: "Admin",Id_Produk: _selectProduk!
    );
    try{
      final response = await sendPostRequest(model);

    }catch(e){
      throw Exception('No Internet Connection');
    }


  }
  Future<void> sendPostRequest(PesananModel PesananPost) async {
    // Convert the body to a JSON string
    try {
      print(jsonEncode(PesananPost.toJson()));
      final jsonEncode2 = jsonEncode(PesananPost.toJson());
      final jsonBody = jsonEncode(PesananPost.toJson());
      // Set the headers for the request
      Map<String, String> headers = {
        'Content-Type': 'application/json'
      };
      final url =  Uri.parse(AppConstant.BASE_URL + AppConstant.Post_Pesanan);
      // Send the POST request
      final response = await http.post(url, headers: headers, body: jsonBody);

      // Check the status code of the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        // The request was successful
        print('Request successful!');
        print('Response body: ${response.body}');
      } else {
        // The request failed
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // There was an error making the request
      print('Error: $e');
    }
  }
  String? _selectedSize;
  String _selectedColor = '';
  String? _selectedMaterial;
  String? _selectProduk;
  DateTime selectedDate = DateTime.now();

  TextEditingController _quantityController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Transaksi',
          style: TextStyle(fontWeight: FontWeight.bold
          ),
        ), // Ganti judul AppBar
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Pilih Produk:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              FutureBuilder<List<ProdukModel>>(
                future: getProdukApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton(
                      // Initial Value
                      value: _selectProduk,
                      hint: Text('Select value'),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: snapshot.data!.map((item) {
                        return DropdownMenuItem(
                          value: item.ID,
                          child: Text(item.Jenis_Bahan_ID.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _selectProduk = value! ;
                        setState(() {

                        });
                      },

                    );
                  } else {
                    return Center(child: const CircularProgressIndicator());
                  }
                },
              ),
              Text(
                'Pilih Warna:',
                style: TextStyle(fontSize: 18.0),
              ),

              SizedBox(height: 8.0),
              Row(
                children: [
                  Checkbox(
                    value: _selectedColor == 'Combed Hitam',
                    onChanged: (value) {
                      setState(() {
                        _selectedColor = value! ? 'Combed Hitam' : '';
                      });
                    },
                    activeColor: Color(0xFF387B9A),
                  ),
                  Text('Combed Hitam'),
                  SizedBox(width: 16.0),
                  Checkbox(
                    value: _selectedColor == 'Combed Putih',
                    onChanged: (value) {
                      setState(() {
                        _selectedColor = value! ? 'Combed Putih' : '';
                      });
                    },
                    activeColor: Color(0xFF387B9A),
                  ),
                  Text('Combed Putih'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Pilih Jenis Bahan:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              FutureBuilder<List<BahanModel>>(
                future: getBahanApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton(
                      // Initial Value
                      value: _selectedMaterial,
                      hint: Text('Select value'),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: snapshot.data!.map((item) {
                        return DropdownMenuItem(
                          value: item.ID,
                          child: Text(item.Nama_Bahan.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _selectedMaterial = value! ;
                        setState(() {

                        });
                      },

                    );
                  } else {
                    return Center(child: const CircularProgressIndicator());
                  }
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Pilih Ukuran:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              FutureBuilder<List<UkuranModel>>(
                future: getUkuranApi(),
                builder: (context, snapshot2) {
                  if (snapshot2.hasData) {
                    return DropdownButton(
                      // Initial Value
                      value: _selectedSize,
                      hint: Text('Select value'),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: snapshot2.data!.map((item) {
                        return DropdownMenuItem(
                          value: item.ID,
                          child: Text(item.Ukuran.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _selectedSize = value!;
                        setState(() {

                        });
                      },

                    );
                  } else {
                    return Center(child: const CircularProgressIndicator());
                  }
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
              ),
              SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    postToPesanan();
                    _saveData();
                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF387B9A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildOrderString() {
    return 'Tanggal: ${selectedDate.toString()}\n'
        'Warna: $_selectedColor\n'
        'Jenis Bahan: $_selectedMaterial\n'
        'Ukuran: $_selectedSize\n'
        'Quantity: ${_quantityController.text}\n';
  }

  void _saveData() {
    String orderString = _buildOrderString();
    print(orderString);
    Navigator.pop(context, orderString);
  }

  void clearInput() {
    setState(() {
      _selectedSize = 'S';
      _selectedColor = '';
      _selectedMaterial = null;
      selectedDate = DateTime.now();
      _quantityController.clear();
      _selectProduk='';
    });
  }
}
