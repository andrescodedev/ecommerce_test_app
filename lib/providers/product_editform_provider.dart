import 'package:ecommerce_test_app/models/models.dart';
import 'package:flutter/material.dart';

class ProductEditFormProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _priceFieldState = true;

  ///
  /// GETTERS AND SETTERS
  ///
  bool get priceFieldState => _priceFieldState;

  set priceFieldState(bool state) {
    _priceFieldState = state;
    notifyListeners();
  }

  ///
  /// FUNCTIONS
  ///
  bool? isValidForm() {
    return formKey.currentState?.validate();
  }

  void availabilityUpdated(bool value, ProductModel product) {
    product.disponible = value;
    notifyListeners();
  }
}
