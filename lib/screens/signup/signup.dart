import 'package:flutter/material.dart';
import 'package:proyectoecommerce/screens/welcome/welcomen.dart';
import 'package:proyectoecommerce/widgets/botones/botonEstilo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyectoecommerce/auth.dart';

class signup extends StatelessWidget {
  const signup({super.key});
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
                  horizontal: size.width * 0.25, vertical: size.width * 0.03),
              child: TextField(
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                    labelStyle: TextStyle(
                        color: Color(0xFFBEBCBC), fontWeight: FontWeight.w700)),
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
                obscureText: true, // Use obscureText for password confirmation

                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'contraseña',
                    labelStyle: TextStyle(
                        color: Color(0xFFBEBCBC), fontWeight: FontWeight.w700)),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.25, vertical: size.width * 0.03),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                obscureText: true, // Use obscureText for password confirmation

                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Repita contraseña',
                    labelStyle: TextStyle(
                        color: Color(0xFFBEBCBC), fontWeight: FontWeight.w700)),
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
                            // Call Auth.registerUsingEmailPassword with the email and password values
                            await Auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                          } else {
                            // Passwords do not match, handle accordingly
                            print('Las contraseñas no coinciden');
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
                            }),
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
