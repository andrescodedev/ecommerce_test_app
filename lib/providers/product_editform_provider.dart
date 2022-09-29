import 'package:ecommerce_test_app/models/models.dart';
import 'package:flutter/material.dart';

class ProductEditFormProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///
  /// FUNCTIONS
  ///
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void availabilityUpdated(bool value, ProductModel product) {
    product.disponible = value;
    notifyListeners();
  }
}
