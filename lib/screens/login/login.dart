import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoecommerce/screens/signup/signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

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
              SizedBox(
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
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Bienvenido",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.bold,
                      fontFamily: '',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Image.asset(
                  "/home/jcerveram/flutterProjects/proyectoecommerce/lib/img/welcome.png",
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.4,
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
                      "/home/jcerveram/flutterProjects/proyectoecommerce/lib/img/google-removebg-preview.png",
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        fixedSize: Size(screenWidth * 0.2, screenHeight * 0.06),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: screenHeight * 0.03,                                    
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        fixedSize: Size(screenWidth * 0.2, screenHeight * 0.06),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Footer
            ],
          ),
        ),
      ),
    );
  }
}
