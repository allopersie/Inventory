import 'dart:convert';

import 'package:flutter/material.dart';

List<BahanModel> bahanModelFromJson(String str) =>
    List<BahanModel>.from(json.decode(str).map((x) => BahanModel.fromJson(x)));



class BahanModel {
  BahanModel({
    required this.ID,
    required this.Nama_Bahan,
    required this.Keterangan
  });
  String ID;
  String Nama_Bahan;
  String Keterangan;

  factory BahanModel.fromJson(Map<String, dynamic> json) => BahanModel(
    ID: json["ID"],
    Nama_Bahan: json["Nama_Bahan"],
    Keterangan: json["Keterangan"],

  );

  Map<String, dynamic> toJson() => {
    "ID": ID,
    "Nama_Bahan": Nama_Bahan,
    "Keterangan": Keterangan,
  };
  static List<BahanModel> listFromJson(List<dynamic> json){
    return json.map((e) => BahanModel.fromJson(e)).toList();}
}

class UkuranModel {
  UkuranModel({
    required this.ID,
    required this.Ukuran,
    required this.Keterangan
  });
  String ID;
  String Ukuran;
  String Keterangan;

  factory UkuranModel.fromJson(Map<String, dynamic> json) => UkuranModel(
    ID: json["ID"],
    Ukuran: json["Ukuran"],
    Keterangan: json["Keterangan"],

  );

  Map<String, dynamic> toJson() => {
    "ID": ID,
    "Ukuran": Ukuran,
    "Keterangan": Keterangan,
  };
  static List<UkuranModel> listFromJson(List<dynamic> json){
    return json.map((e) => UkuranModel.fromJson(e)).toList();}
}

class PesananModel {
  final String ID;
  final String Tanggal;
  final String Warna;
  final int? Jenis_Bahan_ID;
  final int Ukuran_ID;
  final int Quantity;
  final String Created;
  final String Createdby;
  final String Id_Produk;


  PesananModel({
    required this.ID,
    required this.Tanggal,
    required this.Warna,
    required this.Jenis_Bahan_ID,
    required this.Ukuran_ID,
    required this.Quantity,
    required this.Created,
    required this.Createdby,
    required this.Id_Produk,


  });

  factory PesananModel.fromJson(Map<String, dynamic> json) {
    return PesananModel(
        ID: json['ID'],
        Tanggal: json['Tanggal'],
        Warna: json['Warna'],
        Jenis_Bahan_ID: json['Jenis_Bahan_ID'],
        Ukuran_ID: json['Ukuran_ID'],
        Quantity: json['Quantity'],
        Created: json['Created'],
        Createdby: json['createdby'],
      Id_Produk: json['Id_Produk'],

    );
  }

  Map<String, dynamic> toJson() {
    return{
    'ID': ID,
    'Tanggal': Tanggal,
    'Warna': Warna,
    'Jenis_Bahan_ID': Jenis_Bahan_ID,
    'Ukuran_ID': Ukuran_ID,
    'Quantity': Quantity,
    'Created': Created,
    'CreatedBy': Createdby,
    'Id_Produk': Id_Produk,
  };
  }
    static List<PesananModel> listFromJson(List<dynamic> json){
    return json.map((e) => PesananModel.fromJson(e)).toList();
  }

}

class PesananModelVW {
  final String ID;
  final String Tanggal;
  final String Warna;
  final int? Jenis_Bahan_ID;
  final int? Ukuran_ID;
  final int? Quantity;
  final String Created;
  final String Createdby;
  final String Ukuran;
  final String Nama_Bahan;

  PesananModelVW({
    required this.ID,
    required this.Tanggal,
    required this.Warna,
    required this.Jenis_Bahan_ID,
    required this.Ukuran_ID,
    required this.Quantity,
    required this.Created,
    required this.Createdby,
    required this.Ukuran,
    required this.Nama_Bahan

  });

  factory PesananModelVW.fromJson(Map<String, dynamic> json) {
    return PesananModelVW(
        ID: json['ID'],
        Tanggal: json['Tanggal'],
        Warna: json['Warna'],
        Jenis_Bahan_ID: json['Jenis_Bahan_ID'],
        Ukuran_ID: json['Ukuran_ID'],
        Quantity: json['Quantity'],
        Created: json['Created'],
        Createdby: json['createdby'],
        Ukuran: json['Ukuran'],
        Nama_Bahan: json['Nama_Bahan']
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'ID': ID,
      'Tanggal': Tanggal,
      'Warna': Warna,
      'Jenis_Bahan_ID': Jenis_Bahan_ID,
      'Ukuran_ID': Ukuran_ID,
      'Quantity': Quantity,
      'Created': Created,
      'CreatedBy': Createdby,
      'Ukuran': Ukuran,
      'Nama_Bahan': Nama_Bahan
    };
  }
  static List<PesananModelVW> listFromJson(List<dynamic> json){
    return json.map((e) => PesananModelVW.fromJson(e)).toList();
  }

}

class ProdukModel {
  final String ID;
  final String Tanggal;
  final String Warna;
  final int? Jenis_Bahan_ID;
  final int Ukuran_ID;
  final int Quantity;
  final String Created;
  final String Createdby;

  ProdukModel({
    required this.ID,
    required this.Tanggal,
    required this.Warna,
    required this.Jenis_Bahan_ID,
    required this.Ukuran_ID,
    required this.Quantity,
    required this.Created,
    required this.Createdby


  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
        ID: json['ID'],
        Tanggal: json['Tanggal'],
        Warna: json['Warna'],
        Jenis_Bahan_ID: json['Jenis_Bahan_ID'],
        Ukuran_ID: json['Ukuran_ID'],
        Quantity: json['Quantity'],
        Created: json['Created'],
        Createdby: json['createdby']

    );
  }

  Map<String, dynamic> toJson() {
    return{
      'ID': ID,
      'Tanggal': Tanggal,
      'Warna': Warna,
      'Jenis_Bahan_ID': Jenis_Bahan_ID,
      'Ukuran_ID': Ukuran_ID,
      'Quantity': Quantity,
      'Created': Created,
      'CreatedBy': Createdby
    };
  }
  static List<ProdukModel> listFromJson(List<dynamic> json){
    return json.map((e) => ProdukModel.fromJson(e)).toList();
  }
}

class ProdukModelVW {
  final String? ID;
  final String? Tanggal;
  final String? Warna;
  final int? Jenis_Bahan_ID;
  final int? Ukuran_ID;
  final int? Quantity;
  final String? Created;
  final String? Createdby;
  final String? Ukuran;
  final String? Nama_Bahan;

  ProdukModelVW({
    required this.ID,
    required this.Tanggal,
    required this.Warna,
    required this.Jenis_Bahan_ID,
    required this.Ukuran_ID,
    required this.Quantity,
    required this.Created,
    required this.Createdby,
    required this.Ukuran,
    required this.Nama_Bahan

  });

  factory ProdukModelVW.fromJson(Map<String, dynamic> json) {
    return ProdukModelVW(
        ID: json['ID'],
        Tanggal: json['Tanggal'],
        Warna: json['Warna'],
        Jenis_Bahan_ID: json['Jenis_Bahan_ID'],
        Ukuran_ID: json['Ukuran_ID'],
        Quantity: json['Quantity'],
        Created: json['Created'],
        Createdby: json['createdby'],
        Ukuran: json['Ukuran'],
        Nama_Bahan: json['Nama_Bahan']
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'ID': ID,
      'Tanggal': Tanggal,
      'Warna': Warna,
      'Jenis_Bahan_ID': Jenis_Bahan_ID,
      'Ukuran_ID': Ukuran_ID,
      'Quantity': Quantity,
      'Created': Created,
      'CreatedBy': Createdby,
      'Ukuran': Ukuran,
      'Nama_Bahan': Nama_Bahan
    };
  }
  static List<ProdukModelVW> listFromJson(List<dynamic> json){
    return json.map((e) => ProdukModelVW.fromJson(e)).toList();
  }
}
class PesananProdukModel {
  final String? ID;
  final String? Tanggal;
  final String? Warna;
  final int? Jenis_Bahan_ID;
  final int? Ukuran_ID;
  final int? QuantityStok;
  final String? Created;
  final String? Createdby;
  final String? Ukuran;
  final String? Nama_Bahan;
  final int? QuantityPesan;

  PesananProdukModel({
    required this.ID,
    required this.Tanggal,
    required this.Warna,
    required this.Jenis_Bahan_ID,
    required this.Ukuran_ID,
    required this.QuantityStok,
    required this.Created,
    required this.Createdby,
    required this.Ukuran,
    required this.Nama_Bahan,
    required this.QuantityPesan

  });

  factory PesananProdukModel.fromJson(Map<String, dynamic> json) {
    return PesananProdukModel(
        ID: json['ID'],
        Tanggal: json['Tanggal'],
        Warna: json['Warna'],
        Jenis_Bahan_ID: json['Jenis_Bahan_ID'],
        Ukuran_ID: json['Ukuran_ID'],
        QuantityStok: json['qtyStok'],
        Created: json['Created'],
        Createdby: json['createdby'],
        Ukuran: json['Ukuran'],
        Nama_Bahan: json['Nama_Bahan'],
        QuantityPesan: json['qtyPesan']
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'ID': ID,
      'Tanggal': Tanggal,
      'Warna': Warna,
      'Jenis_Bahan_ID': Jenis_Bahan_ID,
      'Ukuran_ID': Ukuran_ID,
      'qtyStok': QuantityStok,
      'Created': Created,
      'CreatedBy': Createdby,
      'Ukuran': Ukuran,
      'Nama_Bahan': Nama_Bahan,
      'QuantityPesan': QuantityPesan
    };
  }
  static List<PesananProdukModel> listFromJson(List<dynamic> json){
    return json.map((e) => PesananProdukModel.fromJson(e)).toList();
  }

}
class UserModel {
  UserModel({
    required this.ID,
    required this.UserName,
    required this.URoleID,
    required this.RoleName
  });
  String ID;
  String UserName;
  String URoleID;
  String RoleName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    ID: json["ID"],
    UserName: json["UserName"],
    URoleID: json["URoleID"],
    RoleName: json["RoleName"],

  );

  Map<String, dynamic> toJson() => {
    "ID": ID,
    "UserName": UserName,
    "URoleID": URoleID,
    "RoleName": RoleName,
  };
  static List<UserModel> listFromJson(List<dynamic> json){
    return json.map((e) => UserModel.fromJson(e)).toList();}
}

class MenuModel {
  MenuModel({
    required this.ID,
    required this.ID_Menu,
    required this.Module,
    required this.PageName,
    required this.ID_Role,
    required this.RoleName,
    required this.IsCanView,
    required this.IsCanAdd,
    required this.IsCanEdit,
    required this.IsCanDelete,
    required this.IsCanApprove,
    required this.IsCanTerminate,
    required this.IsCanVerify
  });
  String ID;
  String ID_Menu;
  String Module;
  String PageName;
  String ID_Role;
  String RoleName;
  bool IsCanView;
  bool IsCanAdd;
  bool IsCanEdit;
  bool IsCanDelete;
  bool IsCanApprove;
  bool IsCanTerminate;
  bool IsCanVerify;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
    ID: json["ID"],
    ID_Menu: json["ID_Menu"],
    Module: json["Module"],
    PageName: json["PageName"],
    ID_Role: json["ID_Role"],
    RoleName: json["RoleName"],
    IsCanView: json["IsCanView"],
    IsCanAdd: json["IsCanAdd"],
    IsCanEdit: json["IsCanEdit"],
    IsCanDelete: json["IsCanDelete"],
    IsCanApprove: json["IsCanApprove"],
    IsCanTerminate: json["IsCanTerminate"],
    IsCanVerify: json["IsCanVerify"],

  );

  Map<String, dynamic> toJson() => {
    "ID": ID,
    "ID_Menu": ID_Menu,
    "Module": Module,
    "PageName": PageName,
    "ID_Role": ID_Role,
    "RoleName": RoleName,
    "IsCanView": IsCanView,
    "IsCanAdd": IsCanAdd,
    "IsCanEdit": IsCanEdit,
    "IsCanDelete": IsCanDelete,
    "IsCanApprove": IsCanApprove,
    "IsCanTerminate": IsCanTerminate,
    "IsCanVerify": IsCanVerify,
  };

  static List<MenuModel> listFromJson(List<dynamic> json){
    return json.map((e) => MenuModel.fromJson(e)).toList();}
}
