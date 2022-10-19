import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final formProvider = Provider.of<SignUpInProvider>(context);

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
              child: Form(
                key: formProvider.signInFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Inicio de sesión',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
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
                      onChanged: (value) {},
                      validator: (value) => formProvider.validateEmail(value),
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
                      onChanged: (value) {},
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
                          : const Text('Iniciar sesión'),
                      onPressed: (formProvider.formInProcess)
                          ? null
                          : () async {
                              if (await formProvider.validateSignInForm() ==
                                  true) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/stores',
                                );
                              }
                            },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '¿No tienes una cuenta?',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                            context,
                            '/signup',
                          ),
                          child: const Text(
                            'Crear cuenta',
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
        ],
      ),
    );
  }
}
