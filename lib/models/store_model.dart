import 'dart:convert';

class StoreModel {
  StoreModel({
    required this.nombre,
    required this.telefono,
    required this.disponible,
    this.key,
    this.foto,
  });

  String nombre;
  int telefono;
  bool disponible;
  String? key;
  String? foto;

  factory StoreModel.fromJson(String str) =>
      StoreModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoreModel.fromMap(Map<String, dynamic> json) => StoreModel(
        disponible: json["disponible"],
        foto: json["foto"],
        nombre: json["nombre"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toMap() => {
        "disponible": disponible,
        "foto": foto,
        "nombre": nombre,
        "telefono": telefono,
      };
}
