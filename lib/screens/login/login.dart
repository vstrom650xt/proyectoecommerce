import 'package:flutter/material.dart';
//falta un import  MIN 15:40

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight + 22,
              ),
              Center(child: const Text("Bienvenido")),
              const SizedBox(height: 12),
              const Text("Lo que sea"),
              Center(
                child: Image.asset(
                    "/home/jcerveram/flutterProjects/proyectoecommerce/lib/img/welcome.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
