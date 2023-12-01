import 'dart:io';

import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      
    );
  }
}
