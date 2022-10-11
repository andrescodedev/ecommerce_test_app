import 'dart:io';
import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<ProductModel> _products = [];
  bool _isLoadingProducts = true;
  File _newPhotoFile = File('');

  ProductModel _selectedProduct = ProductModel(
    disponible: false,
    nombre: '',
    precio: 0,
  );

  ProductModel _temporaryProduct = ProductModel(
    disponible: false,
    nombre: '',
    precio: 0,
  );

  ///
  /// GETTERS
  ///
  List<ProductModel> get products => _products;
  bool get isLoadingProducts => _isLoadingProducts;
  ProductModel get selectedProduct => _selectedProduct;
  ProductModel get temporaryProduct => _temporaryProduct;
  File get newPhotoFile => _newPhotoFile;

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

  /// THIS FUNCTION GETS THE PRODUCTS FROM A SINGLE STORE
  void getProductsByStoreFromService({required String storeKey}) async {
    _products.clear();
    _products = await _productService.loadProductsByStore(
      storeKey: storeKey,
    );
    _isLoadingProducts = false;
    notifyListeners();
  }

  /// THIS FUNCTION UPGRADES THE PRODUCT OF A SINGLE STORE
  void updatedProductByStoreFromService({
    required String storeKey,
  }) async {
    print(_temporaryProduct.nombre);
    bool updateSuccessful = await _productService.updatedProductByStore(
      storeKey: storeKey,
      product: _temporaryProduct,
    );

    if (updateSuccessful) {
      int productIndex = _products
          .indexWhere((element) => element.key == _temporaryProduct.key);
      _products[productIndex] = _temporaryProduct;
      notifyListeners();
    } else {
      print('No se pudo actualizar el producto');
    }
  }

  /// THIS FUNCTION CREATES THE PRODUCT OF A SINGLE STORE
  void createProductByStoreFromService({
    required String storeKey,
  }) async {
    bool createSuccessful = await _productService.createProductByStore(
      storeKey: storeKey,
      product: _temporaryProduct,
    );

    if (createSuccessful) {
      print(_temporaryProduct.key);
      _products.add(_temporaryProduct);
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
      nombre: '',
      precio: 0,
    );
  }

  void setTemporaryProduct(ProductModel selectedProductCopy) {
    _temporaryProduct = selectedProductCopy;
  }

  ProductModel selectedProductCopy() {
    return ProductModel(
      disponible: _selectedProduct.disponible,
      nombre: _selectedProduct.nombre,
      precio: _selectedProduct.precio,
      foto: _selectedProduct.foto,
      key: _selectedProduct.key,
    );
  }

  void createOrUpdateProduct({required String storeKey}) {
    if (_temporaryProduct.key == null) {
      createProductByStoreFromService(
        storeKey: storeKey,
      );
    } else {
      updatedProductByStoreFromService(
        storeKey: storeKey,
      );
    }
  }

  void updateSelectedProductPhoto({String? path}) {
    if (path != null) {
      _newPhotoFile = File(path);
    }
    _temporaryProduct.foto = path;
    //newPhotoFile = File.fromUri(Uri(path: path));
    //notifyListeners();
  }
}
