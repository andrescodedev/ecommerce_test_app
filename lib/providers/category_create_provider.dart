import 'package:flutter/material.dart';

class CategoryCreateProvider extends ChangeNotifier {
  final GlobalKey<FormState> _categoryFormKey = GlobalKey<FormState>();

  String _categoryName = '';

  bool _categoryFormInProcess = false;
  bool _categoryAvailability = false;

  /*
    GETTERS 
  */
  GlobalKey<FormState> get categoryFormKey => _categoryFormKey;
  String get categoryName => _categoryName;
  bool get categoryFormInProcess => _categoryFormInProcess;
  bool get categoryAvailability => _categoryAvailability;

  /* 
    SETTERS
  */
  set categoryFormInProcess(bool value) {
    _categoryFormInProcess = value;
    notifyListeners();
  }

  set categoryAvailability(bool value) {
    _categoryAvailability = value;
    notifyListeners();
  }

  /*
    Auxiliar functions
  */
  void setCategoryName(String categoryName) {
    _categoryName = categoryName;
  }

  /* 
    Validations
  */
  String? validateCategoryeName(String? value) {
    if (value != null && value != '') {
      return null;
    } else {
      return 'El nombre de la categoría es obligatorio';
    }
  }

  bool? validateCategoryCreateForm() {
    FocusManager.instance.primaryFocus?.unfocus();
    return _categoryFormKey.currentState?.validate();
  }
}
