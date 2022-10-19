import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthenticationService {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDqLlSPO1h1UqRETbbeJcKrzOLY4Pd2IRY';

  Future<String?> signUpAnUser({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> storeEmailPassword = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signUp',
      {
        'key': _firebaseToken,
      },
    );

    http.Response requestResponse =
        await http.post(url, body: json.encode(storeEmailPassword));

    Map<String, dynamic> authResponse = json.decode(requestResponse.body);
  }
}
