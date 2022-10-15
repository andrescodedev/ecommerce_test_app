import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: const [
            BackgroundSignInUpWidget(),
            LogoStoreWidget(),
            SignInFormWidget(),
          ],
        ),
      ),
    );
  }
}
