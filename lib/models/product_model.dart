import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.available,
    required this.name,
    required this.price,
    this.id,
    this.picture,
  });

  bool available;
  String name;
  int price;
  String? id;
  String? picture;

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };
}
