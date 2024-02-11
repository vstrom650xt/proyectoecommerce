import 'package:flutter/material.dart';

class CategoriaCard extends StatelessWidget {
  final String nombre;
  final String url;

  const CategoriaCard({
    Key? key,
    required this.nombre,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(nombre),
        subtitle: Text(url),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de CategoriaCard'),
        ),
        body: Center(
          child: CategoriaCard(
            nombre: 'Ejemplo de Categoria',
            url: 'https://ejemplo.com',
          ),
        ),
      ),
    );
  }
}
