import 'dart:convert';
import 'package:ecommerce_test_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService with ChangeNotifier {
  ///
  /// VARIABLES
  ///
  final String _baseUrl =
      'ecommerce-test-app-a9cf5-default-rtdb.firebaseio.com';

  final List<ProductModel> products = [];

  bool isLoading = true;

  ProductModel _selectedProduct = ProductModel(
    disponible: false,
    id: '',
    nombre: '',
    precio: 0,
  );

  ///
  /// SETTERS AND GETTERS
  ///
  ProductModel get selectedProduct => _selectedProduct;

  set selectedProduct(ProductModel product) {
    _selectedProduct = product;
    notifyListeners();
  }

  ///
  /// FUNCTIONS
  ///
  void loadProductsByStore({
    required StoreModel store,
  }) async {
    print('Load products by store');
    /*isLoading = true;
    notifyListeners();*/

    Uri url = Uri.https(_baseUrl, '/productos/${store.id}.json');
    http.Response response = await http.get(url);

    final Map<String, dynamic> productsMap = await json.decode(response.body);

    productsMap.forEach((key, value) {
      final productTemp = ProductModel.fromMap(value);
      //productTemp.id = key;
      print(productTemp.toMap());
      products.add(productTemp);
    });

    isLoading = false;
    notifyListeners();
  }
}
