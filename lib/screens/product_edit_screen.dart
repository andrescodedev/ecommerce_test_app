import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Column(
          children: const [
            ProductImageWidget(),
          ],
        ),
      ),
    );
  }
}
