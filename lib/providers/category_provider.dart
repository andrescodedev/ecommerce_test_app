import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService _categoryService = CategoryService();

  String _categoryProcessErrorMessage = '';
  String _categoryProcessSuccessfulMessage = '';

  bool _categoryProcessError = false;
  bool _categoryProcessSuccessful = false;

  List<CategoryModel> _categoriesList = [];

  // GETTERS
  String get categoryProcessErrorMessage => _categoryProcessErrorMessage;
  String get categoryProcessSuccessfulMessage =>
      _categoryProcessSuccessfulMessage;

  bool get categoryProcessError => _categoryProcessError;
  bool get categoryProcessSuccessful => _categoryProcessSuccessful;

  List<CategoryModel> get categoriesList => _categoriesList;

  Future getCategoriesProvider({
    required String storeUid,
  }) async {
    final serviceResponse =
        await _categoryService.getCategoriesService(storeUid: storeUid);

    if (serviceResponse == 'SERVER_EXCEPTION') {
      _categoryProcessError = true;
      _categoryProcessErrorMessage =
          'Problemas en el servidor. Intente más tarde';
    } else if (serviceResponse == 'NETWORK_EXCEPTION') {
      _categoryProcessError = true;
      _categoryProcessErrorMessage = 'Problemas de conexión. Intente de nuevo';
    } else {
      _categoriesList = serviceResponse;
    }
  }

  Future categoryCreateProvider({
    required String categoryName,
    required bool categoryAvailability,
    required String storeUid,
  }) async {
    bool? serviceResponse = await _categoryService.categoryCreateService(
      categoryName: categoryName,
      categoryAvailability: categoryAvailability,
      storeUid: storeUid,
    );

    if (serviceResponse == true) {
      _categoryProcessSuccessful = true;
      _categoryProcessSuccessfulMessage = 'Categoría creada exitosamente';
    } else if (serviceResponse == false) {
      _categoryProcessError = true;
      _categoryProcessErrorMessage =
          'No se creó la categoría. Intente nuevamente';
    } else {
      _categoryProcessError = true;
      _categoryProcessErrorMessage = 'Problemas de servidor. Intente más tarde';
    }
  }
}
