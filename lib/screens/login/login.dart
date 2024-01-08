import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectoecommerce/auth.dart';
import 'package:proyectoecommerce/screens/home/home.dart';
import 'package:proyectoecommerce/screens/welcome/welcomen.dart';
import 'package:proyectoecommerce/widgets/botones/botonEstilo.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/img/login.png",
                height: screenHeight * 0.4,
                width: screenWidth * 0.4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.25, vertical: size.width * 0.03),
                child: TextField(
                  style: const TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      labelStyle: TextStyle(
                          color: Color(0xFFBEBCBC),
                          fontWeight: FontWeight.w700)),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'contraseña',
                      labelStyle: TextStyle(
                          color: Color(0xFFBEBCBC),
                          fontWeight: FontWeight.w700)),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(54.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BotonEstilo(
                          screenWidth: screenWidth / 1.5,
                          screenHeight: screenHeight,
                          text: "Iniciar",
                          onPressed: () async {
                            print('Email value: $email');
                            print('contra value: $password');
                            try {
                              // Llama al método signInWithEmailAndPassword
                              User? user =
                                  await Auth.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              print('usuario ->: $user');

                              if (user != null) {
                                // El inicio de sesión fue exitoso
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Estás dentro correctamente'),
                                      content: const Text('Estás dentro'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const home()),
                                            )
                                          },
                                          child: const Text('Cerrar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                // El inicio de sesión falló
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Incorrecto'),
                                      content: const Text(
                                          'Credenciales incorrectas'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                          },
                                          child: const Text('Cerrar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } catch (e) {
                              // Manejo de errores
                              print('Error al iniciar sesión: $e');
                            }
                          }),
                      const SizedBox(width: 10.0),
                      BotonEstilo(
                          screenWidth: screenWidth / 1.5,
                          screenHeight: screenHeight,
                          text: "Volver",
                          onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const welcomen()),
                                )
                              })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
