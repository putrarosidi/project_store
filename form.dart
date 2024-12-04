import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AppForm extends StatefulWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController kodeController,
      namaController,
      hargaController;

  AppForm(
      {required this.formkey,
        required this.kodeController,
        required this.namaController,
        required this.hargaController});

  @override
  AppFormState createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      autovalidateMode: AutovalidateMode.always,
      child: SingleChildScrollView(
        child: Column(
          children: [
            txtKode(),
            txtNama(),
            txtHarga(),
          ],
        ),
      ),
    );
  }

  Widget txtKode() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
      child: TextFormField(
        controller: widget.kodeController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Kode Produk",
          prefixIcon: Icon(Icons.code),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Masukkan Kode Produk';
          }
          return null;
        },
      ),
    );
  }

  Widget txtNama() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
      child: TextFormField(
        controller: widget.namaController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Nama Produk",
          prefixIcon: Icon(Icons.shopping_bag),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Masukkan Nama Produk';
          }
          return null;
        },
      ),
    );
  }

  Widget txtHarga() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
      child: TextFormField(
        controller: widget.hargaController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Harga Produk",
          prefixIcon: Icon(Icons.monetization_on),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Masukkan Harga Produk';
          }
          return null;
        },
      ),
    );
  }
}
