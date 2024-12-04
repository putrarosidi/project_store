import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:belajarform/apii.dart';
import 'produk_edit.dart';
import 'mitems.dart';

class ProdukDetail extends StatefulWidget {
  final ItemModel sw;
  ProdukDetail({required this.sw});
  @override
  State<StatefulWidget> createState() => ProdukDetailState();
}

class ProdukDetailState extends State<ProdukDetail> {
  void deleteProduk(context) async {
    http.Response response = await http.post(
        Uri.parse(BaseUrl.Delete),
        body: {
          'id': widget.sw.id.toString(),
        });
    final data = json.decode(response.body);
    if (data['success']) {
      pesan();
      Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
  }

  pesan() {
    Fluttertoast.showToast(
        msg: "Penghapusan Data Berhasil",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("Konfirmasi Penghapusan", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('Anda yakin menghapus data ini?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Batal", style: TextStyle(fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            ElevatedButton(
              onPressed: () => deleteProduk(context),
              child: Text("Hapus", style: TextStyle(fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Barang",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[600],
        elevation: 10.0,
        actions: [
          IconButton(
            onPressed: () => confirmDelete(context),
            icon: Icon(Icons.delete, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            shadowColor: Colors.teal[200],
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(Icons.star, 'ID Produk:', widget.sw.id.toString()),
                  _buildDetailRow(Icons.tag, 'Kode Produk:', widget.sw.kode_produk),
                  _buildDetailRow(Icons.adb, 'Nama Produk:', widget.sw.nama_produk),
                  _buildDetailRow(Icons.monetization_on, 'Harga:', "Rp. ${widget.sw.harga}"),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[600],
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => ProdukEdit(sw: widget.sw)),
        ),
        child: Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.teal[600]),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              '$label $value',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
