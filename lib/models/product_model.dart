import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.disponible,
    required this.id,
    required this.nombre,
    required this.precio,
    this.foto,
  });

  String id;
  String nombre;
  bool disponible;
  int precio;
  String? foto;

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        disponible: json["disponible"],
        foto: json["foto"],
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toMap() => {
        "disponible": disponible,
        "foto": foto,
        "id": id,
        "nombre": nombre,
        "precio": precio,
      };
}
