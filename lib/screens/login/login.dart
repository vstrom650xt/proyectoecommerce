import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: kToolbarHeight + 2,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Color.fromARGB(255, 94, 32, 209)
                  ], // Colores del gradiente
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Bienvenido",
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: '',
                    color: Colors.white, // Color del texto en el gradiente
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28), // Separación entre textos
            Center(
              child: Image.asset(
                "/home/jcerveram/flutterProjects/proyectoecommerce/lib/img/welcome.png",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    "/home/jcerveram/flutterProjects/proyectoecommerce/lib/img/google-removebg-preview.png",
                    scale: 10,
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      fixedSize: const Size(250, 50),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      fixedSize: const Size(250, 50),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //       Container(
                  //         child: Image.asset(
                  //           "/home/jcerveram/flutterProjects/proyectoecommerce/lib/img/image.png",
                  //        ),
                  //        decoration: const BoxDecoration(
                  //          borderRadius: BorderRadius.all(Radius.circular(90)),
                  //        ),
                  //      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
