class ItemModel {
  final int id;
  final String kode_produk;
  final String nama_produk;
  final int harga;

  ItemModel({
    required this.id,
    required this.kode_produk,
    required this.nama_produk,
    required this.harga,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] ?? 0,
      kode_produk: json['kode_produk'] ?? '',
      nama_produk: json['nama_produk'] ?? '',
      harga: json['harga'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'kode_produk': kode_produk,
    'nama_produk': nama_produk,
    'harga': harga,
  };
}