import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class StoresListScreen extends StatelessWidget {
  const StoresListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiendas'),
      ),
      body: (storeProvider.isLoadingStores)
          ? const CustomLoadingWidget()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              itemCount: storeProvider.stores.length,
              itemBuilder: (context, index) {
                final store = storeProvider.stores[index];

                return GestureDetector(
                  onTap: () {
                    storeProvider.selectedStore = store;
                    //productProvider.products.clear();
                    productProvider.getProductsByStoreFromService(
                      storeId: store.id,
                    );
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
