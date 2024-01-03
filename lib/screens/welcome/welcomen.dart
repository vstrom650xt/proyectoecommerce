import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoecommerce/screens/login/login.dart';
import 'package:proyectoecommerce/screens/signup/signup.dart';
import 'package:proyectoecommerce/widgets/botones/botonEstilo.dart';

class welcomen extends StatelessWidget {
  const welcomen({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double iconSize = screenWidth * 0.1;
    double googleImageSize = screenHeight * 0.1;

    return Container(
      child: Scaffold(
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
                    colors: [Colors.blue, Color.fromARGB(255, 94, 32, 209)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: screenWidth *
                              0.18, // Ajusta según tus preferencias
                        ),
                        child: Text(
                          "Bienvenido",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Image.asset(
                  "lib/img/welcome.png",
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.8,
                ),
              ),
              Row(
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
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      "lib/img/google-removebg-preview.png",
                      height: googleImageSize,
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    BotonEstilo(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        text: "Login",
                        onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()),
                              )
                            }),
                    SizedBox(height: screenHeight * 0.03),
                    BotonEstilo(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        text: "Registro",
                        onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup()),
                              )
                            }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
