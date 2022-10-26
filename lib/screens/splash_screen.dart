import 'package:ecommerce_test_app/utils/secure_storage/secure_storage_util.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final secureStorage = SecureStorageUtil();

  @override
  void initState() {
    String userToken;

    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      userToken = await secureStorage.tokenRead();

      (userToken.isEmpty)
          ? Navigator.pushReplacementNamed(context, '/signin')
          : Navigator.pushReplacementNamed(context, '/dashboard');
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
