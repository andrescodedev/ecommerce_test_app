import 'dart:convert';
import 'package:ecommerce_test_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductService {
  ///
  /// VARIABLES
  ///
  final String _baseUrl =
      'ecommerce-test-app-a9cf5-default-rtdb.firebaseio.com';

  final List<ProductModel> products = [];

  ///
  /// API REST FUNCTIONS
  ///
  Future<List<ProductModel>> loadProductsByStore({
    required String storeId,
  }) async {
    Uri url = Uri.https(_baseUrl, '/productos/$storeId.json');
    http.Response response = await http.get(url);

    final Map<String, dynamic> productsMap = await json.decode(response.body);

    productsMap.forEach((key, value) {
      final productTemp = ProductModel.fromMap(value);
      //productTemp.id = key;
      print(productTemp.toMap());
      products.add(productTemp);
    });

    return products;
  }

  Future<bool> updatedProductByStore({
    required String storeId,
    required ProductModel product,
  }) async {
    Uri url = Uri.https(_baseUrl, '/productos/$storeId/${product.id}.json');
    http.Response response = await http.put(url, body: product.toJson());

    return (response.statusCode == 200) ? true : false;
  }

  Future<bool> createProductByStore({
    required String storeId,
    required ProductModel product,
  }) async {
    Uri url = Uri.https(_baseUrl, '/productos/$storeId.json');
    http.Response response = await http.post(url, body: product.toJson());

    return (response.statusCode == 200) ? true : false;
  }
}
