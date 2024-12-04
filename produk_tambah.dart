import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:belajarform/apii.dart';
import 'package:http/http.dart' as http;

class ProdukTambah extends StatefulWidget{
  const ProdukTambah({super.key});
  @override
  State<StatefulWidget> createState() => ProdukTambahState();
}

class ProdukTambahState extends State<ProdukTambah>{
  final formkey = GlobalKey<FormState>();
  TextEditingController kodeController = new TextEditingController();
  TextEditingController namaController = new TextEditingController();
  TextEditingController hargaController = new TextEditingController();

  Future createSw() async {
    return await http.post(
        Uri.parse(BaseUrl.Insert),
        body: {
          'kode_produk': kodeController.text,
          'nama_produk': namaController.text,
          'harga': hargaController.text,
        }
    );
  }

  void _onConfirm(context) async {
    http.Response response = await createSw();
    final data = json.decode(response.body);
    if(data['success']) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Data Barang",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4.0,
      ),
      body: Container(
        child: Column(
          children: [
            _textboxKode(),
            _textboxNama(),
            _textboxHarga(),
            const SizedBox(height: 20.0), // Memberikan jarak antara input form dan tombol
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textboxKode() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Kode Barang",
          prefixIcon: Icon(Icons.tag), // Menambahkan ikon di dalam input form
          border: InputBorder.none, // Menghilangkan border default
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Mengatur padding
        ),
        controller: kodeController,
      ),
    );
  }

  _textboxNama() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Nama Barang",
          prefixIcon: Icon(Icons.adb), // Menambahkan ikon di dalam input form
          border: InputBorder.none, // Menghilangkan border default
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Mengatur padding
        ),
        controller: namaController,
      ),
    );
  }

  _textboxHarga() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Harga Barang",
          prefixIcon: Icon(Icons.monetization_on), // Menambahkan ikon di dalam input form
          border: InputBorder.none, // Menghilangkan border default
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Mengatur padding
        ),
        controller: hargaController,
      ),
    );
  }


  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        _onConfirm(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.cyan, // Warna teks
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Membuat sudut tombol melengkung
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0), // Padding di dalam tombol
        elevation: 5.0, // Efek shadow di bawah tombol
        shadowColor: Colors.grey.withOpacity(0.5), // Warna shadow
      ),
      child: const Text(
        'Tambah',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}