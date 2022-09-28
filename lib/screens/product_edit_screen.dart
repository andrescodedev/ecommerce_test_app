import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)?.settings.arguments as ProductModel;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            ProductImageWidget(
              productPhoto: product.foto,
            ),
            const ProductEditFormWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
