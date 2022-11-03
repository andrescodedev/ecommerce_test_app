import 'dart:convert';
import 'package:ecommerce_test_app/models/models.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  final String _baseUrl =
      'ecommerce-test-app-a9cf5-default-rtdb.firebaseio.com';
  /*
    FALTA IMPLEMENTAR LOS SERVICIOS DE ACTUALIZACIÓN
    Y ELIMINACIÓN DE CATEGORÍA
  */

  Future<dynamic> getCategoriesService({
    required String storeUid,
  }) async {
    Uri url = Uri.https(_baseUrl, '/categorias/$storeUid.json');

    Map<String, dynamic>? serviceResponse;
    List<CategoryModel> categories = [];

    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        serviceResponse = json.decode(response.body);
        print(serviceResponse);

        if (serviceResponse != null) {
          print('entramos al if');
          serviceResponse.forEach((key, value) {
            print('building a category');
            CategoryModel category = CategoryModel.fromMap(value);
            category.key = key;
            categories.add(category);
          });

          print(categories);
        }

        print(serviceResponse);

        return categories;
      } else {
        return 'SERVER_EXCEPTION';
      }
    } catch (e) {
      return 'NETWORK_EXCEPTION';
    }
  }

  Future<bool?> categoryCreateService({
    required String categoryName,
    required bool categoryAvailability,
    required String storeUid,
  }) async {
    Uri url = Uri.https(_baseUrl, '/categorias/$storeUid.json');

    Map<String, dynamic> newCategory = {
      'nombre': categoryName,
      'disponible': categoryAvailability,
    };

    try {
      http.Response response =
          await http.post(url, body: json.encode(newCategory));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return null;
    }
  }

  /* 
    Funciones de ayuda
  */

  /*Future<List<CategoryModel>> _buildingCategoryList(
    Map<String, dynamic> serviceResponse,
  ) async {
    print('estamos construyendo la lista');
    List<CategoryModel> categories = [];

    serviceResponse.forEach((key, value) {
      CategoryModel category = CategoryModel.fromJson(value);
      category.key = key;
      categories.add(category);
    });

    print(categories);
    return categories;
  }*/
}
