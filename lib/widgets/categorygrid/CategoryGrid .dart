import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          _getCategoriesFromDatabase(), // Obtiene las categorías desde la base de datos
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        // Si hay datos, muestra el grid
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas en el grid
            crossAxisSpacing: 10.0, // Espacio entre columnas
            mainAxisSpacing: 10.0, // Espacio entre filas
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            // Construye un elemento del grid con la información de la categoría
            final category = snapshot.data!.docs[index];
            return GridTile(
              child: Container(
                color: Colors.blueGrey[100],
                child: Center(
                  child: Text(
                    category['name'], // Nombre de la categoría
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Método para obtener las categorías desde la base de datos
  Future<QuerySnapshot> _getCategoriesFromDatabase() async {
    return await FirebaseFirestore.instance.collection('categories').get();
  }
}
