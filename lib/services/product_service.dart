import 'dart:convert';
import 'dart:io';
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

  Future<String?> uploadPhotoToCloudinary({required File photoFile}) async {
    final url =
        Uri.parse('https://api.cloudinary.com/v1_1/dfhbhqzdt/image/upload');

    final imageUploadRequest = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'ml_default'
      ..files.add(await http.MultipartFile.fromPath('file', photoFile.path));

    http.StreamedResponse streamedResponse = await imageUploadRequest.send();

    if (streamedResponse.statusCode == 200) {
      print('Imagen cargada correctamente');
      http.Response response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      Map<String, dynamic> secureUrl = json.decode(response.body);
      return secureUrl['secure_url'];
    } else {
      print('Algo salio mal al cargar la imagen');
      return null;
    }
  }
}

/*
  var uri = Uri.https('example.com', 'create');
var request = http.MultipartRequest('POST', uri)
  ..fields['user'] = 'nweiz@google.com'
  ..files.add(await http.MultipartFile.fromPath(
      'package', 'build/package.tar.gz',
      contentType: MediaType('application', 'x-tar')));
var response = await request.send();
if (response.statusCode == 200) print('Uploaded!');



 */
