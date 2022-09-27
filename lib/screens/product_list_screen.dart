import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Hola mundo');
    final productService = Provider.of<ProductService>(context);
    print('Hola munde');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: (productService.isLoading)
          ? const CustomLoadingWidget()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              itemCount: productService.products.length,
              itemBuilder: (context, index) {
                ProductModel product = productService.products[index];

                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/details'),
                  child: ProductCardWidget(
                    product: product,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
