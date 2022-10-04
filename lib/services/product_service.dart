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
    required String storeKey,
  }) async {
    Uri url = Uri.https(_baseUrl, '/productos/$storeKey.json');
    http.Response response = await http.get(url);

    final Map<String, dynamic> productsMap = await json.decode(response.body);

    productsMap.forEach((key, value) {
      final productTemp = ProductModel.fromMap(value);
      productTemp.key = key;
      print(productTemp.toMap());
      products.add(productTemp);
    });

    return products;
  }

  Future<bool> updatedProductByStore({
    required String storeKey,
    required ProductModel product,
  }) async {
    Uri url = Uri.https(_baseUrl, '/productos/$storeKey/${product.key}.json');
    http.Response response = await http.put(url, body: product.toJson());

    return (response.statusCode == 200) ? true : false;
  }

  Future<bool> createProductByStore({
    required String storeKey,
    required ProductModel product,
  }) async {
    Uri url = Uri.https(_baseUrl, '/productos/$storeKey.json');
    http.Response response = await http.post(url, body: product.toJson());
    final decodeResponse = json.decode(response.body);
    product.key = decodeResponse['name'];

    return (response.statusCode == 200) ? true : false;
  }
}
