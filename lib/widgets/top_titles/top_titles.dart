import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyectoecommerce/screens/carrito/carrito.dart';
import 'package:proyectoecommerce/screens/login/login.dart';
import 'package:proyectoecommerce/screens/signup/signup.dart';
import 'package:proyectoecommerce/screens/profile/profile.dart';

class TopTitles extends StatefulWidget {
  final String subtitle;
  final String title;

  const TopTitles({Key? key, required this.subtitle, required this.title})
      : super(key: key);

  @override
  _TopTitlesState createState() => _TopTitlesState();
}

class _TopTitlesState extends State<TopTitles> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _isLoggedIn = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              _isLoggedIn ? "lib/img/login.png" : "lib/img/login.png",
              height: 50, // Altura deseada del logo
              width: 50, // Ancho deseado del logo
            ),
            const SizedBox(width: 10), // Espacio entre el logo y el título
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20, // Tamaño de fuente del título
                fontWeight: FontWeight.bold, // Peso de la fuente del título
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10), // Márgenes horizontal
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10), // Relleno horizontal
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Borde redondeado
                    color: Colors.grey[200], // Color de fondo
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Buscar...", // Texto de sugerencia
                            border: InputBorder.none, // Sin borde
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        tooltip: 'Buscar',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuButton<int>(
                icon: _isLoggedIn
                    ? const Icon(Icons.person)
                    : const Icon(Icons.login),
                itemBuilder: (BuildContext context) {
                  if (_isLoggedIn) {
                    // Si el usuario está autenticado
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        child: Text('Mi perfil'),
                      ),
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Carrito'),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text('Categorías'),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text('Cerrar Sesión'),
                      ),
                    ];
                  } else {
                    // Si el usuario no está autenticado
                    return [
                      const PopupMenuItem<int>(
                        value: 4,
                        child: Text('Login'),
                      ),
                      const PopupMenuItem<int>(
                        value: 5,
                        child: Text('Registro'),
                      ),
                    ];
                  }
                },
                onSelected: (int value) {
                  // Implementa la lógica para el desplegable aquí
                  switch (value) {
                    case 0:
                      // Lógica para Mi perfil

                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => carrito()
                        ),
                      );
                      break;
                    case 2:
                      // Lógica para Categorías
                      break;
                    case 3:
                      // Lógica para Cerrar Sesión
                      FirebaseAuth.instance.signOut();
                      break;
                    case 4:
                      // Lógica para Login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                      break;
                    case 5:
                      // Lógica para Registro
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                      break;
                    default:
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
