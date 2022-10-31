import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:ecommerce_test_app/utils/secure_storage/secure_storage_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final secureStorage = SecureStorageUtil();

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthenticationProvider>(
      context,
      listen: false,
    );
    final storeProvider = Provider.of<StoreProvider>(
      context,
      listen: false,
    );
    String userToken;

    Future.delayed(
        const Duration(
          seconds: 5,
        ), () async {
      userToken = await secureStorage.tokenRead();
      await authProvider.getUserDataByIdTokenProvider(
        idToken: userToken,
      );

      if (authProvider.invalidIdTokenError == true ||
          authProvider.storeNotFoundError == true) {
        Navigator.pushReplacementNamed(context, '/signin');
      } else {
        await storeProvider.authenticatedStoreProvider(
          storeUid: authProvider.storeUid,
        );

        (storeProvider.authenticateStatus)
            ? Navigator.pushReplacementNamed(context, '/dashboard')
            : Navigator.pushReplacementNamed(context, '/signin');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.indigo,
        child: const Center(
          child: Image(
            image: AssetImage('assets/images/logo_white.png'),
          ),
        ),
      ),
    );
  }
}
