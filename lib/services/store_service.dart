import 'dart:convert';
import 'package:ecommerce_test_app/models/models.dart';
import 'package:http/http.dart' as http;

class StoreService {
  final String _baseUrl =
      'ecommerce-test-app-a9cf5-default-rtdb.firebaseio.com';

  /*Future<List<StoreModel>> loadStores() async {
    Uri url = Uri.https(_baseUrl, '/tiendas.json');
    http.Response response = await http.get(url);

    final Map<String, dynamic> productsMap = await json.decode(response.body);

    productsMap.forEach((key, value) {
      final storeTemp = StoreModel.fromMap(value);
      storeTemp.key = key;
      print(storeTemp.toMap());
      stores.add(storeTemp);
    });

    return stores;
  }*/

  Future<StoreModel?> storeCreateService({
    required String storeUid,
    required String storeEmail,
    required String storeName,
  }) async {
    Uri url = Uri.https(_baseUrl, '/tiendas/$storeUid.json');
    Map<String, dynamic> newStore = {
      'nombre': storeName,
      'email': storeEmail,
    };

    http.Response response = await http.patch(url, body: json.encode(newStore));

    if (response.statusCode == 200) {
      StoreModel storeCreated = StoreModel.fromJson(response.body);
      return storeCreated;
    } else {
      return null;
    }
  }

  Future<StoreModel?> authenticatedStoreService({
    required String storeUid,
  }) async {
    Uri url = Uri.https(_baseUrl, '/tiendas/$storeUid.json');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return StoreModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
