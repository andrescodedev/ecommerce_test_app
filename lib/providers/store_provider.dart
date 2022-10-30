import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class StoreProvider with ChangeNotifier {
  final StoreService _storeService = StoreService();

  String _storeName = '';
  String _authenticateStatusErrorMessage = '';
  bool _authenticateStatus = true;
  StoreModel? _authenticatedStore;

  ///
  /// GETTERS
  ///
  String get storeName => _storeName;
  String get authenticateStatusErrorMessage => _authenticateStatusErrorMessage;
  StoreModel? get authenticatedStore => _authenticatedStore;
  bool get authenticateStatus => _authenticateStatus;

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
      _authenticateStatus = false;
      _authenticateStatusErrorMessage = 'La operación no fue exitosa';
    }
  }

  Future authenticatedStoreProvider({
    required String storeUid,
  }) async {
    _authenticatedStore =
        await _storeService.authenticatedStoreService(storeUid: storeUid);

    if (_authenticatedStore == null) {
      _authenticateStatus = false;
      _authenticateStatusErrorMessage = 'La operación no fue exitosa';
    }
  }

  ///
  /// Auxiliar functions
  ///
  void setStoreName(String storeName) {
    _storeName = storeName;
  }
}
