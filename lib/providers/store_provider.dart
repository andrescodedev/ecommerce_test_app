import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class StoreProvider with ChangeNotifier {
  final StoreService _storeService = StoreService();

  List<StoreModel> _stores = [];
  bool _isLoadingStores = true;
  StoreModel _selectedStore = StoreModel(
    nombre: '',
    telefono: 0,
    disponible: false,
  );

  StoreProvider() {
    getStoresFromService();
  }

  ///
  /// GETTERS
  ///
  List<StoreModel> get stores => _stores;
  StoreModel get selectedStore => _selectedStore;
  bool get isLoadingStores => _isLoadingStores;

  ///
  /// SETTERS
  ///
  set selectedStore(StoreModel store) {
    _selectedStore = store;
    notifyListeners();
  }

  ///
  /// HTTP REQUEST FUNCTIONS
  ///
  void getStoresFromService() async {
    _stores = await _storeService.loadStores();
    _isLoadingStores = false;
    notifyListeners();
  }
}
