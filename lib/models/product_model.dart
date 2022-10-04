import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.disponible,
    required this.nombre,
    required this.precio,
    this.key,
    this.foto,
  });

  String nombre;
  bool disponible;
  int precio;
  String? key;
  String? foto;

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        disponible: json["disponible"],
        foto: json["foto"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toMap() => {
        "disponible": disponible,
        "foto": foto,
        "nombre": nombre,
        "precio": precio,
      };
}
