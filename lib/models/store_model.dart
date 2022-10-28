import 'dart:convert';

class StoreModel {
  StoreModel({
    required this.nombre,
    required this.email,
    this.key,
    this.tipoDeNegocio,
    this.descripcion,
    this.direccion,
    this.telefono,
    this.foto,
    this.disponible,
  });

  String nombre;
  String email;

  String? key;
  String? tipoDeNegocio;
  String? descripcion;
  String? direccion;
  int? telefono;
  String? foto;
  bool? disponible;

  factory StoreModel.fromJson(String str) =>
      StoreModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoreModel.fromMap(Map<String, dynamic> json) => StoreModel(
        nombre: json["nombre"],
        email: json["email"],
        tipoDeNegocio: json['tipo_de_negocio'],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        telefono: json['telefono'],
        foto: json["foto"],
        disponible: json["disponible"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "email": email,
        "tipo_de_negocio": tipoDeNegocio,
        "descripcion": descripcion,
        "direccion": direccion,
        "telefono": telefono,
        "foto": foto,
        "disponible": disponible,
      };
}
