import 'package:flutter/material.dart';
import 'package:inventory/main.dart';

import 'Gudang/home_screen_gudang.dart';
import 'Stoker/home_screen_stoker.dart';
import 'home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  void login(BuildContext context) {


    // Simulated authentication
    if (_username == 'admin' && _password == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(role: 'admin')),
      );
    } else if (_username == 'gudang' && _password == 'gudang') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(role: 'gudang')),
      );
    } else if (_username == 'stoker' && _password == 'stoker') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(role: 'stoker')),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Invalid username or password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:20.0, left: 50.0, right: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo/Logo_KKM.png'), // Ganti dengan path gambar Anda
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Username'),
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silakan masukkan username Anda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silakan masukkan password Anda';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){ if (_formKey.currentState?.validate() ?? false) {
                      login(context);
                    }},
                    //onPressed: () {
                     // if (_formKey.currentState?.validate() ?? false) {
                        // Lakukan aksi login di sini
                       // Navigator.pushReplacement(
                        //  context,
                         // MaterialPageRoute(builder: (context) => MyHomePage()),
                        //);
                      //}
                    //},
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF387B9A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
