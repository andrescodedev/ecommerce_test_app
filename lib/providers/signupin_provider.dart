import 'package:flutter/material.dart';

class SignUpInProvider extends ChangeNotifier {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  bool _formInProcess = false;

  /// GETTERS
  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;
  GlobalKey<FormState> get signInFormKey => _signInFormKey;
  bool get formInProcess => _formInProcess;

  ///SETTERS
  set formInProcess(bool value) {
    _formInProcess = value;
    notifyListeners();
  }

  /*bool validateSignInForm() {
    if (_signInFormKey.currentState != false) {
      return true;
    }
  }*/

  Future<bool> validateSignUpForm() async {
    if (_signUpFormKey.currentState?.validate() == true) {
      formInProcess = true;
      FocusManager.instance.primaryFocus?.unfocus();
      await Future.delayed(const Duration(seconds: 3));
      return true;
    } else {
      print('Formulario incorrecto');
      return false;
    }
  }

  String? validateStoreName(String? value) {
    if (value != null && value != '') {
      return null;
    } else {
      return 'El nombre de la tienda es obligatorio';
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(pattern);

    if (value != null && value != '') {
      if (regExp.hasMatch(value)) {
        return null;
      } else {
        return 'El correo electrónico no es valido';
      }
    } else {
      return 'El correo electrónico es obligatorio';
    }
  }

  String? validatePassword(String? value) {
    if (value != null && value != '') {
      if (value.length < 6) {
        return 'Debe tener mínimo 6 carácteres';
      } else {
        return null;
      }
    } else {
      return 'El password es obligatorio';
    }
  }
}
