import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/providers/product_editform_provider.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductEditFormWidget extends StatelessWidget {
  const ProductEditFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final formProvider = Provider.of<ProductEditFormProvider>(context);

    ProductModel product = productService.selectedProduct;

    return Container(
      width: double.infinity,
      height: 250.0,
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Form(
        key: formProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: product.nombre,
              onChanged: (value) => product.nombre = value,
              decoration: const InputDecoration(
                hintText: 'Nombre del producto',
                labelText: 'Nombre:',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El nombre del producto es obligatorio';
                }
              },
            ),
            TextFormField(
              initialValue: '\$${product.precio}',
              onChanged: (value) => product.precio = int.parse(value),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '\$0.0',
                labelText: 'Precio:',
              ),
              validator: (value) {
                if (int.tryParse(value as String) == null) {
                  return 'Ingrese solo valores númericos';
                }
              },
            ),
            SwitchListTile.adaptive(
              title: const Text('Disponible'),
              activeColor: Colors.indigo,
              value: product.disponible,
              onChanged: (value) {
                formProvider.availabilityUpdated(value, product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
