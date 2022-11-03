import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      drawer: const CustomMenuWidget(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: (categoryProvider.categoriesList.isEmpty)
            ? const _NotCategoriesListWidget()
            : const _CategoriesListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/categoryCreate'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CategoriesListWidget extends StatelessWidget {
  const _CategoriesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    List<CategoryModel> categoriesList = categoryProvider.categoriesList;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        children: List.generate(
          categoriesList.length,
          (index) {
            CategoryModel category = categoriesList[index];

            return SizedBox(
              height: 60.0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          category.nombre,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: const Icon(
                              Icons.edit,
                            ),
                            onTap: () {
                              print('editar categoría');
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          (category.disponible)
                              ? GestureDetector(
                                  child: const Icon(
                                    Icons.visibility,
                                  ),
                                  onTap: () {
                                    print('disponible');
                                  },
                                )
                              : GestureDetector(
                                  child: const Icon(
                                    Icons.visibility_off,
                                  ),
                                  onTap: () {},
                                ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.delete,
                            ),
                            onTap: () {
                              print('eliminar categoria');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NotCategoriesListWidget extends StatelessWidget {
  const _NotCategoriesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Text(
          'Comienza a crear la lista de categorías para tus productos ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
