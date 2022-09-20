import 'package:flutter/material.dart';

class ProductEditFormWidget extends StatelessWidget {
  const ProductEditFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nombre del producto',
                labelText: 'Nombre:',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '\$200.000',
                labelText: 'Precio:',
              ),
            ),
            SwitchListTile.adaptive(
              title: const Text('Disponible'),
              activeColor: Colors.indigo,
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
