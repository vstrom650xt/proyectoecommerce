import 'package:flutter/material.dart';
import 'package:proyectoecommerce/screens/welcome/welcomen.dart';
import 'package:proyectoecommerce/widgets/botones/botonEstilo.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
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
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      labelStyle: TextStyle(
                          color: Color(0xFFBEBCBC),
                          fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'contraseña',
                      labelStyle: TextStyle(
                          color: Color(0xFFBEBCBC),
                          fontWeight: FontWeight.w700)),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(54.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BotonEstilo(
                          screenWidth: screenWidth / 1.5,
                          screenHeight: screenHeight,
                          text: "Iniciar",
                          onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()),
                                )
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
                                      builder: (context) => welcomen()),
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
