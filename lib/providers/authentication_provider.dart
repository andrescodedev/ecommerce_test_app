import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final AuthenticationService _authService = AuthenticationService();

  //bool _loadingAuth = false;
  String? _errorMessage;

  ///GETTERS
  String? get errorMessage => _errorMessage;
  //bool get loadingAuth => _loadingAuth;

  void setErrorMessage(String? value) {
    _errorMessage = value;
  }

  Future signUpAnUserFromTheAuthService(
      {required String email, required String password}) async {
    _errorMessage =
        await _authService.signUpAnUser(email: email, password: password);

    print('Ya tenemos valor para error message');

    //_loadingAuth = true;
  }
}
