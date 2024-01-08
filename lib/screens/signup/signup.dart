import 'package:flutter/material.dart';
import 'package:proyectoecommerce/screens/welcome/welcomen.dart';
import 'package:proyectoecommerce/widgets/botones/botonEstilo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyectoecommerce/auth.dart';
import 'package:proyectoecommerce/widgets/show_dialog/dialogo.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String email = '';
    String password = '';
    String confirmPassword = '';
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
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
                horizontal: size.width * 0.25,
                vertical: size.width * 0.03,
              ),
              child: TextField(
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'contraseña',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.25,
                vertical: size.width * 0.03,
              ),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Repita contraseña',
                  labelStyle: TextStyle(
                    color: Color(0xFFBEBCBC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onChanged: (value) {
                  confirmPassword = value;
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
                      text: "Crear",
                      onPressed: () async {
                        print('Email value: $email');
                        print('contra value: $password');

                        // Check if password and confirmPassword match
                        if (password == confirmPassword) {
                          // Call Auth.createUserWithEmailAndPassword with the email and password values
                          await Auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          dialogo(text: "ya va ");
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: const Text('Registrado correctamente'),
                          //       content: const Text(
                          //           'Las Registrado correctamente no coinciden'),
                          //       actions: [
                          //         TextButton(
                          //           onPressed: () => {
                          //             Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) => welcomen()),
                          //             )
                          //           },
                          //           child: const Text('Cerrar'),
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );
                        } else {
                          // Passwords do not match, show a dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content:
                                    const Text('Las contraseñas no coinciden'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Cierra el cuadro de diálogo
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cerrar'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(width: 10.0),
                    BotonEstilo(
                      screenWidth: screenWidth / 1.5,
                      screenHeight: screenHeight,
                      text: "Volver",
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const welcomen(),
                          ),
                        )
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
