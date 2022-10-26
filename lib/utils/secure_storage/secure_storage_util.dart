import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  final secureStorage = const FlutterSecureStorage();

  Future<String> tokenRead() async {
    String userToken;

    userToken = await secureStorage.read(key: 'userToken') ?? '';

    return userToken;
  }

  Future tokenDelete() async {
    await secureStorage.delete(key: 'userToken');
  }
}
