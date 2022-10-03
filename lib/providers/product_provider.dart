import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<ProductModel> _products = [];
  bool _isLoadingProducts = true;

  ProductModel _selectedProduct = ProductModel(
    disponible: false,
    id: '',
    nombre: '',
    precio: 0,
  );

  ///
  /// GETTERS
  ///
  List<ProductModel> get products => _products;
  bool get isLoadingProducts => _isLoadingProducts;
  ProductModel get selectedProduct => _selectedProduct;

  ///
  /// SETTERS
  ///
  set selectedProduct(ProductModel product) {
    _selectedProduct = product;
    notifyListeners();
  }

  ///
  /// HTTP REQUEST FUNCTIONS
  ///
  void getProductsByStoreFromService({required String storeId}) async {
    _products.clear();
    _products = await _productService.loadProductsByStore(
      storeId: storeId,
    );
    _isLoadingProducts = false;
    notifyListeners();
  }

  void updatedProductByStoreFromService({
    required String storeId,
  }) async {
    bool updateSuccessful = await _productService.updatedProductByStore(
      storeId: storeId,
      product: _selectedProduct,
    );

    if (updateSuccessful) {
      int productIndex =
          _products.indexWhere((element) => element.id == _selectedProduct.id);
      _products[productIndex] = _selectedProduct;
      notifyListeners();
    } else {
      print('No se pudo actualizar el producto');
    }
  }

  void createProductByStoreFromService({
    required String storeId,
  }) async {
    bool createSuccessful = await _productService.createProductByStore(
      storeId: storeId,
      product: _selectedProduct,
    );

    if (createSuccessful) {
      _products.add(_selectedProduct);
      notifyListeners();
    } else {
      print('No se pudo crear el producto');
    }
  }

  ///
  /// AUXILIARIES FUNCTIONS
  ///
  ProductModel setProductModel() {
    return ProductModel(
      disponible: false,
      id: '',
      nombre: '',
      precio: 0,
    );
  }

  void createOrUpdateProduct({required String storeId}) {
    if (_selectedProduct.id.isEmpty) {
      createProductByStoreFromService(
        storeId: storeId,
      );
    } else {
      updatedProductByStoreFromService(
        storeId: storeId,
      );
    }
  }

  String identificationMechanism() {
    return '';
  }
}
