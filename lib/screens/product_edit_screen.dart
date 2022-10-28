import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<ProductEditFormProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final storeProvider = Provider.of<StoreProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Column(
          children: const [
            ProductImageWidget(),
            ProductEditFormWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formProvider.isValidForm() == true) {
            if (productProvider.photoFile.path != '') {
              productProvider.temporaryProduct.foto =
                  await productProvider.uploadPhotoToCloudinaryFromService();
            }
            productProvider.createOrUpdateProduct(
              storeKey: storeProvider.authenticatedStore?.key as String,
            );
          }

          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
