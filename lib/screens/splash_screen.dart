import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    String userToken;

    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      userToken = await secureStorage.read(key: 'userToken') ?? '';

      (userToken.isEmpty)
          ? Navigator.pushReplacementNamed(context, '/signin')
          : Navigator.pushReplacementNamed(context, '/stores');
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
