import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:ecommerce_test_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCreateScreen extends StatelessWidget {
  const CategoryCreateScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final categoryCreateProvider = Provider.of<CategoryCreateProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        categoryProvider.callNotifyListeners();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Crear una categoría',
          ),
        ),
        body: GestureDetector(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Form(
              key: categoryCreateProvider.categoryFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    enabled: (categoryCreateProvider.categoryFormInProcess)
                        ? false
                        : true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.category,
                        color: Colors.indigo,
                      ),
                      hintText: 'Nombre de la categoría',
                      labelText: 'Nombre de la categoría:',
                    ),
                    onChanged: (value) =>
                        categoryCreateProvider.setCategoryName(value),
                    validator: (value) =>
                        categoryCreateProvider.validateCategoryeName(value),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SwitchListTile.adaptive(
                    title: const Text(
                      'disponible',
                    ),
                    value: categoryCreateProvider.categoryAvailability,
                    onChanged: (value) {
                      categoryCreateProvider.categoryAvailability = value;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.indigo,
                      ),
                      minimumSize: MaterialStateProperty.all(
                        Size(screenSize.width, screenSize.height * 0.06),
                      ),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    child: (categoryCreateProvider.categoryFormInProcess)
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.0,
                          )
                        : const Text('Crear categoría'),
                    onPressed: (categoryCreateProvider.categoryFormInProcess)
                        ? null
                        : () async {
                            if (categoryCreateProvider
                                    .validateCategoryCreateForm() ==
                                true) {
                              categoryCreateProvider.categoryFormInProcess =
                                  true;

                              await categoryProvider.categoryCreateProvider(
                                categoryName:
                                    categoryCreateProvider.categoryName,
                                categoryAvailability:
                                    categoryCreateProvider.categoryAvailability,
                                storeUid: authProvider.storeUid,
                              );

                              if (categoryProvider.categoryProcessSuccessful ==
                                  true) {
                                categoryCreateProvider.categoryFormInProcess =
                                    false;

                                categoryCreateProvider.setCategoryName('');

                                categoryCreateProvider.categoryAvailability =
                                    false;

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(CustomSnackBarWidget(
                                  snackbarMessage: categoryProvider
                                      .categoryProcessSuccessfulMessage,
                                  iconMessage: Icons.info,
                                ));
                              } else {
                                categoryCreateProvider.categoryFormInProcess =
                                    false;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(CustomSnackBarWidget(
                                  snackbarMessage: categoryProvider
                                      .categoryProcessErrorMessage,
                                  iconMessage: Icons.error,
                                ));
                              }
                            }
                          },
                  ),
                ],
              ),
            ),
          ),
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ),
    );
  }
}
