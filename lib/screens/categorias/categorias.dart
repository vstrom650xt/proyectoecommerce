import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectoecommerce/screens/producto/product.dart'; // Asegúrate de importar correctamente el widget Product

class Categorias extends StatelessWidget {
  final String categoriaId;

  const Categorias({Key? key, required this.categoriaId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos de la categoría $categoriaId'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('productos')
            .where('categoria', isEqualTo: categoriaId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<DocumentSnapshot> productos = snapshot.data!.docs;
          return Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                return ListTile(
                  leading: Image.network(
                    producto['url'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(producto['nombre']),
                  subtitle: Text('Precio: \$${producto['precio']}'),
                  onTap: () {
                    final productId = producto.id;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Product(productId: productId),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
