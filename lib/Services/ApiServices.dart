import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inventory/Model/user_model.dart';

import '../App_Constant/AppConstant.dart';

class ApiService {

  Future<List<PesananModel>> getPesananApi2() async{
    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.Post_Pesanan)) ;
      //final body = json.decode(response.body) as List;
      print(response.body);
      if(response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return PesananModel.listFromJson(data);

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

  Future<List<UkuranModel>> getUkuranApi() async{
    try {
      final response = await http.get(Uri.parse(AppConstant.BASE_URL + AppConstant.BAHAN)) ;
      //final body = json.decode(response.body) as List;
      print(response.body);
      if(response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return UkuranModel.listFromJson(data);
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');
  }
}