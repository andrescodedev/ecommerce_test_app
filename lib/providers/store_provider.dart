import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class StoreProvider with ChangeNotifier {
  final StoreService _storeService = StoreService();

  String _storeName = '';
  String _statusErrorMessage = '';
  bool _storeStatus = true;
  StoreModel? _authenticatedStore;

  ///
  /// GETTERS
  ///
  String get storeName => _storeName;
  String get statusErrorMessage => _statusErrorMessage;
  StoreModel? get authenticatedStore => _authenticatedStore;
  bool get storeStatus => _storeStatus;

  ///
  /// SETTERS
  ///
  /*set authenticatedStore(StoreModel? store) {
    _authenticatedStore = store;
    notifyListeners();
  }*/

  ///
  /// HTTP REQUEST FUNCTIONS
  ///
  Future storeCreateProvider({
    required String storeUid,
    required String storeEmail,
  }) async {
    _authenticatedStore = await _storeService.storeCreateService(
      storeUid: storeUid,
      storeEmail: storeEmail,
      storeName: _storeName,
    );

    if (_authenticatedStore == null) {
      _storeStatus = false;
      _statusErrorMessage = 'La operación no fue exítosa';
    }
  }

  ///
  /// Auxiliar functions
  ///
  void setStoreName(String storeName) {
    _storeName = storeName;
  }
}
