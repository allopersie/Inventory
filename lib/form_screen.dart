import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _selectedSize = 'S';
  String _selectedColor = '';
  String? _selectedMaterial;
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
        title: Text('Form'), // Ganti judul AppBar
        iconTheme: IconThemeData(color: Colors.white),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    title: Text('20s'),
                    value: '20s',
                    groupValue: _selectedMaterial,
                    onChanged: (value) {
                      setState(() {
                        _selectedMaterial = value;
                      });
                    },
                    activeColor: Color(0xFF387B9A),
                  ),
                  RadioListTile(
                    title: Text('24s'),
                    value: '24s',
                    groupValue: _selectedMaterial,
                    onChanged: (value) {
                      setState(() {
                        _selectedMaterial = value;
                      });
                    },
                    activeColor: Color(0xFF387B9A),
                  ),
                  RadioListTile(
                    title: Text('30s'),
                    value: '30s',
                    groupValue: _selectedMaterial,
                    onChanged: (value) {
                      setState(() {
                        _selectedMaterial = value;
                      });
                    },
                    activeColor: Color(0xFF387B9A),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Pilih Ukuran:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              DropdownButton<String>(
                value: _selectedSize,
                onChanged: (newValue) {
                  setState(() {
                    _selectedSize = newValue ?? 'S';
                  });
                },
                items: <String>['S', 'M', 'L', 'XL', 'XXL', '3XL']
                    .map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
    });
  }
}
