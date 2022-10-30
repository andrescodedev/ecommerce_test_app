import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDqLlSPO1h1UqRETbbeJcKrzOLY4Pd2IRY';
  final secureStorage = const FlutterSecureStorage();

  Future<dynamic> signUpAnUser({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> signUpServiceResponse;

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

      signUpServiceResponse = json.decode(requestResponse.body);

      if (requestResponse.statusCode == 200) {
        /// Guardamos el token que nos devolvió la petición
        /// en el secure storage como userToken
        await secureStorage.write(
            key: 'userToken', value: signUpServiceResponse['idToken']);

        return signUpServiceResponse;
      } else if (requestResponse.statusCode == 400) {
        return signUpServiceResponse['error']['message'];
      }
    } catch (e) {
      return 'Problemas al realizar la petición';
    }
  }

  Future<dynamic> signInAnUser({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> signInServiceResponse = {};

    Map<String, dynamic> storeCredentials = {
      'email': email,
      'password': password,
    };

    Uri url = Uri.https(
      _baseUrl,
      '/v1/accounts:signInWithPassword',
      {
        'key': _firebaseToken,
      },
    );

    try {
      http.Response requestResponse =
          await http.post(url, body: json.encode(storeCredentials));

      signInServiceResponse = json.decode(requestResponse.body);

      if (requestResponse.statusCode == 200) {
        await secureStorage.write(
          key: 'userToken',
          value: signInServiceResponse['idToken'],
        );

        return signInServiceResponse;
      } else if (requestResponse.statusCode == 400) {
        return signInServiceResponse['error']['message'];
      }
    } catch (e) {
      return 'No se pudo realizar la petición. Revisa tu conexión de internet';
    }
  }

  /*Future logOutAnUser() async {
    await secureStorage.delete(key: 'userToken');
  }*/

  /*Future<String> tokenCheck() async {
    return await secureStorage.read(key: 'userToken') ?? '';
  }*/
}
