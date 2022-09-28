import 'package:ecommerce_test_app/models/models.dart';
import 'package:flutter/material.dart';

class ProductEditFormProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //ProductModel productSelected;

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
