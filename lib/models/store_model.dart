import 'dart:convert';

class StoreModel {
  StoreModel({
    required this.id,
    required this.nombre,
    required this.telefono,
    required this.disponible,
    this.foto,
  });

  String id;
  String nombre;
  int telefono;
  bool disponible;
  String? foto;

  factory StoreModel.fromJson(String str) =>
      StoreModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoreModel.fromMap(Map<String, dynamic> json) => StoreModel(
        disponible: json["disponible"],
        foto: json["foto"],
        id: json["id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toMap() => {
        "disponible": disponible,
        "foto": foto,
        "id": id,
        "nombre": nombre,
        "telefono": telefono,
      };
}
