import 'package:flutter/material.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
              height: screenSize.height * 0.5,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Form(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El email es obligatorio';
                        }
                      },
                    ),
                    TextFormField(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'La contraseña es obligatoria';
                        }
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
                      child: const Text('Sign In'),
                      onPressed: () {},
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
