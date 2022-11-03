import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    StoreModel store = storeProvider.authenticatedStore as StoreModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      drawer: const CustomMenuWidget(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            'Bienvenido ${store.nombre}\n a su tienda virtual',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
