import 'package:flutter/material.dart';

class SignUpInProvider extends ChangeNotifier {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  bool _formInProcess = false;
  String _email = '';
  String _password = '';

  /// GETTERS
  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;
  GlobalKey<FormState> get signInFormKey => _signInFormKey;
  bool get formInProcess => _formInProcess;
  String get email => _email;
  String get password => _password;

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
  void setEmail(String value) {
    _email = value;
  }

  void setPassword(String value) {
    _password = value;
  }

  bool? validateSignUpForm() {
    FocusManager.instance.primaryFocus?.unfocus();
    return _signUpFormKey.currentState?.validate();
  }

  bool? validateSignInForm() {
    FocusManager.instance.primaryFocus?.unfocus();
    return _signInFormKey.currentState?.validate();
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
