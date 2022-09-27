import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class StoresListScreen extends StatelessWidget {
  const StoresListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeService = Provider.of<StoreService>(context);
    final productService = Provider.of<ProductService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiendas'),
      ),
      body: (storeService.isLoading)
          ? const CustomLoadingWidget()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              itemCount: storeService.stores.length,
              itemBuilder: (context, index) {
                final store = storeService.stores[index];

                return GestureDetector(
                  onTap: () {
                    productService.products.clear();
                    productService.loadProductsByStore(store: store);
                    Navigator.pushNamed(
                      context,
                      '/products',
                    );
                  },
                  child: StoreCardWidget(
                    store: store,
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
