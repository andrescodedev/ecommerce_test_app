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
    print('Load products by store');

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

  void updatedProductByStore({
    required String storeId,
    required ProductModel product,
  }) async {
    Uri url = Uri.https(_baseUrl, '/productos/$storeId/${product.id}.json');
    http.Response response = await http.put(url, body: product.toJson());

    print(response.body);
  }
}
