import 'dart:convert';
import 'package:ecommerce_test_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoreService with ChangeNotifier {
  final String _baseUrl =
      'ecommerce-test-app-a9cf5-default-rtdb.firebaseio.com';
  final List<StoreModel> stores = [];

  bool isLoading = true;

  StoreService() {
    loadStores();
  }

  /*void loadProducts() async {
    print('Iniamos el loadProducts');
    Uri url = Uri.https(_baseUrl, '/productos.json');
    http.Response response = await http.get(url);

    final Map<String, dynamic> productsMap = await json.decode(response.body);

    productsMap.forEach((key, value) {
      final productTemp = ProductModel.fromMap(value);
      //productTemp.id = key;

      products.add(productTemp);
    });

    print(products);
  }*/

  void loadStores() async {
    print('Load stores');
    isLoading = true;
    notifyListeners();

    Uri url = Uri.https(_baseUrl, '/tiendas.json');
    http.Response response = await http.get(url);

    final Map<String, dynamic> productsMap = await json.decode(response.body);

    productsMap.forEach((key, value) {
      final storeTemp = StoreModel.fromMap(value);
      //productTemp.id = key;
      print(storeTemp.toMap());
      stores.add(storeTemp);
    });

    isLoading = false;
    notifyListeners();
  }
}
