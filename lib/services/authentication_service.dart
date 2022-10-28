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

  Future<String?> signInAnUser({
    required String email,
    required String password,
  }) async {
    String? responseMessage;
    Map<String, dynamic> signInWithPasswordResponse = {};

    Map<String, dynamic> storeEmailPassword = {
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
          await http.post(url, body: json.encode(storeEmailPassword));
      if (requestResponse.statusCode == 200) {
        Map<String, dynamic> authServiceResponse =
            json.decode(requestResponse.body);

        await secureStorage.write(
            key: 'userToken', value: authServiceResponse['idToken']);

        print(requestResponse.body);
        responseMessage = null;
      } else if (requestResponse.statusCode == 400) {
        signInWithPasswordResponse = json.decode(requestResponse.body);
        responseMessage = signInWithPasswordResponse['error']['message'];
        print(signInWithPasswordResponse);
      }
    } catch (e) {
      responseMessage = 'Problemas al realizar la petición';
    }

    return responseMessage;
  }

  /*Future logOutAnUser() async {
    await secureStorage.delete(key: 'userToken');
  }*/

  /*Future<String> tokenCheck() async {
    return await secureStorage.read(key: 'userToken') ?? '';
  }*/
}
