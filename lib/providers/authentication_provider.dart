import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final AuthenticationService _authService = AuthenticationService();

  bool _emailError = false;
  bool _passwordError = false;
  String _emailNotFound = '';
  String _emailExists = '';
  String _invalidPassword = '';

  ///GETTERS
  bool get emailError => _emailError;
  bool get passwordError => _passwordError;

  Future signUpAnUserFromTheAuthService(
      {required String email, required String password}) async {
    String? response =
        await _authService.signUpAnUser(email: email, password: password);

    if (response != null) {
      _emailError = true;
      _emailExists = response;
    }
  }

  Future signInAnUserFromTheAuthService(
      {required String email, required String password}) async {
    String? response =
        await _authService.signInAnUser(email: email, password: password);

    if (response != null && response == 'EMAIL_NOT_FOUND') {
      _emailError = true;
      _emailNotFound = 'Correo electrónico incorrecto';
    } else if (response != null && response == 'INVALID_PASSWORD') {
      _passwordError = true;
      _invalidPassword = 'Contraseña incorrecta';
    }
  }

  String emailAlreadyExists() {
    _emailError = false;
    return _emailExists;
  }

  String emailNotFound() {
    _emailError = false;
    return _emailNotFound;
  }

  String invalidPassword() {
    _passwordError = false;
    return _invalidPassword;
  }
}
