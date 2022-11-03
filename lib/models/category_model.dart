import 'dart:convert';

class CategoryModel {
  CategoryModel({
    required this.disponible,
    required this.nombre,
    this.key,
  });

  String nombre;
  bool disponible;
  String? key;

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        disponible: json["disponible"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "disponible": disponible,
        "nombre": nombre,
      };
}
