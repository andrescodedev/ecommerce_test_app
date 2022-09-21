import 'package:ecommerce_test_app/screens/screens.dart';
import 'package:ecommerce_test_app/services/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProductService(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce Test App',
      theme: ThemeData.light().copyWith(
        //Colors.grey[300]
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          centerTitle: true,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0.0,
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const ProductListScreen(),
        '/details': (context) => const ProductEditScreen(),
      },
    );
  }
}
