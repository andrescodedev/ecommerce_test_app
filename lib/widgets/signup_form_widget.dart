import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final formProvider = Provider.of<SignUpInProvider>(context);
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final storeProvider = Provider.of<StoreProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.3,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.6,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formProvider.signUpFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        enabled: (formProvider.formInProcess) ? false : true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.storefront_rounded,
                            color: Colors.indigo,
                          ),
                          hintText: 'Nombre de la tienda',
                          labelText: 'Nombre:',
                        ),
                        onChanged: (value) => storeProvider.setStoreName(value),
                        validator: (value) =>
                            formProvider.validateStoreName(value),
                      ),
                      TextFormField(
                        enabled: (formProvider.formInProcess) ? false : true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Correo electrónico',
                          labelText: 'Correo electrónico:',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.indigo,
                          ),
                        ),
                        onChanged: (value) => formProvider.setEmail(value),
                        validator: (value) => (authProvider.emailError == true)
                            ? authProvider.emailAlreadyExists()
                            : formProvider.validateEmail(value),
                      ),
                      TextFormField(
                        enabled: (formProvider.formInProcess) ? false : true,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Contraseña',
                          labelText: 'Contraseña:',
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.indigo,
                          ),
                        ),
                        onChanged: (value) => formProvider.setPassword(value),
                        validator: (value) =>
                            formProvider.validatePassword(value),
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
                        child: (formProvider.formInProcess)
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              )
                            : const Text('Registrar'),
                        onPressed: (formProvider.formInProcess)
                            ? null
                            : () async {
                                if (formProvider.validateSignUpForm() == true) {
                                  formProvider.formInProcess = true;
                                  await authProvider.signUpAnUserProvider(
                                    email: formProvider.email,
                                    password: formProvider.password,
                                  );

                                  if (authProvider.responseError == true) {
                                    formProvider.formInProcess = false;
                                  } else {
                                    await storeProvider.storeCreateProvider(
                                      storeEmail: authProvider.storeEmail,
                                      storeUid: authProvider.storeUid,
                                    );

                                    if (storeProvider.storeStatus == true) {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/dashboard',
                                      );
                                    }
                                  }
                                }
                              },
                      ),
                      Text(
                        (storeProvider.storeStatus)
                            ? ''
                            : storeProvider.statusErrorMessage,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '¿Ya tienes una cuenta?',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                              context,
                              '/signin',
                            ),
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
