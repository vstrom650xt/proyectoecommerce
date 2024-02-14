import 'package:flutter/material.dart';
import 'package:proyectoecommerce/widgets/botones/botonEstilo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyectoecommerce/auth.dart';
import 'package:proyectoecommerce/widgets/show_dialog/dialogo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoecommerce/screens/home/home.dart';

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
                        if (password.length < 6) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const dialogo(
                                textoSuperior: "Error",
                                textInferior:
                                    "La contraseña debe tener al menos 6 caracteres",
                              );
                            },
                          );
                        } else {
                          try {
                            List<String> signInMethods = await FirebaseAuth
                                .instance
                                .fetchSignInMethodsForEmail(email);

                            if (signInMethods.contains("password")) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const dialogo(
                                    textInferior: "Error",
                                    textoSuperior:
                                        "Ya existe un usuario con este correo electrónico",
                                  );
                                },
                              );
                            } else {
                              await Auth.createUserWithEmailAndPassword(
                                email: email,
                                password: password,
                              );

                              FirebaseFirestore firestore =
                                  FirebaseFirestore.instance;
                              await firestore.collection('usuario').add({
                                'email': email,
                                // Puedes agregar más campos según tus necesidades
                              });

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const dialogo(
                                    textInferior: "ya va ",
                                    textoSuperior: "es el superior????",
                                  );
                                },
                              );
                            }
                          } catch (e) {
                            // Manejar errores, por ejemplo, si hay problemas con la conexión a Internet
                            print("Error al verificar el usuario: $e");
                          }
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
                            builder: (context) => const Home(),
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
