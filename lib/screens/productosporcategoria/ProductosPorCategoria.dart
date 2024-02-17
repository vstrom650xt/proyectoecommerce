import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductosPorCategoria extends StatelessWidget {
  final String categoria;

  const ProductosPorCategoria({Key? key, required this.categoria})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos de la categoría $categoria'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('productos')
            .where('categoria', isEqualTo: categoria)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No hay productos disponibles en esta categoría.'),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              final productName = document['nombre'] as String;
              final productPrice = document['precio'] as double;
              final productDescription = document['descripcion'] as String;
              final productImageUrl = document['url'] as String;

              return ListTile(
                title: Text(productName),
                subtitle: Text('\$$productPrice'),
                onTap: () {
                  // Aquí puedes agregar la navegación para ver detalles del producto
                },
                leading: Image.network(
                  productImageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
