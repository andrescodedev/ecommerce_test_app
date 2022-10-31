import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:ecommerce_test_app/utils/secure_storage/secure_storage_util.dart';
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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  child: Text('T'),
                ),
                title: Text(store.nombre),
                subtitle: Text(store.email),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
            ),
            const ListTile(
              leading: Icon(Icons.storefront_rounded),
              title: Text('Perfil'),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Faoproductos'),
              onTap: () => Navigator.pushReplacementNamed(context, '/products'),
            ),
            const ListTile(
              leading: Icon(Icons.shopping_bag_rounded),
              title: Text('Faopedidos'),
            ),
            const ListTile(
              leading: Icon(Icons.history),
              title: Text('Historial'),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text('Ayuda'),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Cerrar Sesión'),
              onTap: () async {
                final secureStorage = SecureStorageUtil();

                await secureStorage.tokenDelete();

                Navigator.pushReplacementNamed(context, '/signin');
              },
            ),
          ],
        ),
      ),
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
