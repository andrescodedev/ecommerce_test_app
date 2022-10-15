import 'package:flutter/material.dart';

class LogoStoreWidget extends StatelessWidget {
  const LogoStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Icon(
          Icons.storefront_rounded,
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
