import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthenticationService {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDqLlSPO1h1UqRETbbeJcKrzOLY4Pd2IRY';

  Future<String?> signUpAnUser({
    required String email,
    required String password,
  }) async {
    String? responseMessage;

    Map<String, dynamic> storeEmailPassword = {
      'email': email,
      'password': password,
    };

    Uri url = Uri.https(
      _baseUrl,
      '/v1/accounts:signUp',
      {
        'key': _firebaseToken,
      },
    );

    try {
      http.Response requestResponse =
          await http.post(url, body: json.encode(storeEmailPassword));
      if (requestResponse.statusCode == 200) {
        /*Map<String, dynamic> authServiceResponse =
            json.decode(requestResponse.body);*/
        print(requestResponse.body);
        responseMessage = null;
      } else if (requestResponse.statusCode == 400) {
        print(requestResponse.body);
        responseMessage = 'El correo electrónico ya existe';
      }
    } catch (e) {
      responseMessage = 'Problemas al realizar la petición';
    }

    return responseMessage;
  }
}