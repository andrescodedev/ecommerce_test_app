import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final AuthenticationService _authService = AuthenticationService();

  String _storeEmail = '';
  String _storeUid = '';
  String _emailNotFoundOrDisabledAccount = '';
  String _emailExists = '';
  String _invalidPassword = '';
  String _operationNotAllowed = '';
  String _tooManyAttemptsTryLater = '';

  bool _emailErrorOrAccountError = false;
  bool _passwordError = false;
  bool _responseError = false;

  ///GETTERS
  String get storeEmail => _storeEmail;
  String get storeUid => _storeUid;
  bool get emailErrorOrAccountError => _emailErrorOrAccountError;
  bool get passwordError => _passwordError;
  bool get responseError => _responseError;

  ///
  /// PROVIDER METHODS FOR HTTPS SERVICE METHODS
  ///
  Future signUpAnUserProvider({
    required String email,
    required String password,
  }) async {
    dynamic serviceResponse =
        await _authService.signUpAnUser(email: email, password: password);

    if (serviceResponse == 'EMAIL_EXISTS') {
      _emailErrorOrAccountError = true;
      _responseError = true;
      _emailExists = 'Este correo electrónico ya existe';
    } else if (serviceResponse == 'OPERATION_NOT_ALLOWED') {
      _responseError = true;
      _operationNotAllowed = 'Registro con contraseña está inhabilitado';
    } else if (serviceResponse == 'TOO_MANY_ATTEMPTS_TRY_LATER') {
      _responseError = true;
      _tooManyAttemptsTryLater =
          'Hemos bloqueado todas las solicitudes. Intente mas tarde';
    } else {
      _storeEmail = serviceResponse['email'];
      _storeUid = serviceResponse['localId'];
    }
  }

  Future signInAnUserProvider({
    required String email,
    required String password,
  }) async {
    dynamic serviceResponse =
        await _authService.signInAnUser(email: email, password: password);

    if (serviceResponse == 'EMAIL_NOT_FOUND') {
      _emailErrorOrAccountError = true;
      _emailNotFoundOrDisabledAccount = 'Correo electrónico incorrecto';
    } else if (serviceResponse == 'INVALID_PASSWORD') {
      _passwordError = true;
      _invalidPassword = 'Contraseña incorrecta';
    } else if (serviceResponse == 'USER_DISABLED') {
      _emailErrorOrAccountError = true;
      _emailNotFoundOrDisabledAccount = 'Su cuenta ha sido desactivada';
    } else {
      _storeUid = serviceResponse['localId'];
    }
  }

  String emailAlreadyExists() {
    _emailErrorOrAccountError = false;
    return _emailExists;
  }

  String emailNotFoundOrDisabledAccount() {
    _emailErrorOrAccountError = false;
    return _emailNotFoundOrDisabledAccount;
  }

  String invalidPassword() {
    _passwordError = false;
    return _invalidPassword;
  }

  String operationNotAllowed() {
    return _operationNotAllowed;
  }

  String tooManyAttemptsTryLater() {
    return _tooManyAttemptsTryLater;
  }
}
