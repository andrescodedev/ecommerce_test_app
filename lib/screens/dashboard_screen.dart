import 'package:ecommerce_test_app/utils/secure_storage/secure_storage_util.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  child: Text('T'),
                ),
                title: Text('Nombre de la tienda'),
                subtitle: Text('tipo de tienda'),
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
            const ListTile(
              leading: Icon(Icons.list),
              title: Text('Faoproductos'),
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
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            'Bienvenido a \ntu tienda virtual',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
