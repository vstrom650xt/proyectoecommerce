import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoecommerce/auth.dart';
import 'package:proyectoecommerce/screens/home/home.dart';
import 'package:proyectoecommerce/screens/welcome/welcomen.dart';
import 'package:proyectoecommerce/widgets/botones/botonEstilo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);
class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double googleImageSize = screenHeight * 0.1;
    ValueNotifier userCredential = ValueNotifier('');


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
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: screenHeight * 0.1,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    CupertinoButton(
                      onPressed: () async {
                        userCredential.value = await Auth.signInWithGoogle();
                        if (userCredential.value != null)
                          print(userCredential.value.user!.email);
                      },
                      padding: EdgeInsets.zero,
                      child: Image.asset(
                        "lib/img/google-removebg-preview.png",
                        height: googleImageSize,
                      ),
                    ),
                  ],
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
                                // ignore: use_build_context_synchronously
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
