import 'dart:convert';
import 'package:ecommerce_test_app/models/models.dart';
import 'package:http/http.dart' as http;

class StoreService {
  final String _baseUrl =
      'ecommerce-test-app-a9cf5-default-rtdb.firebaseio.com';
  final List<StoreModel> stores = [];

  Future<List<StoreModel>> loadStores() async {
    Uri url = Uri.https(_baseUrl, '/tiendas.json');
    http.Response response = await http.get(url);

    final Map<String, dynamic> productsMap = await json.decode(response.body);

    productsMap.forEach((key, value) {
      final storeTemp = StoreModel.fromMap(value);
      //productTemp.id = key;
      print(storeTemp.toMap());
      stores.add(storeTemp);
    });

    return stores;
  }
}
