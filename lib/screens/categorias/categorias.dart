import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                    width:
                        50, // Ajusta el tamaño de la imagen según sea necesario
                    height: 50,
                    fit: BoxFit
                        .cover, // Ajusta la forma en que la imagen se ajusta al widget
                  ),
                  title: Text(producto['nombre']),
                  subtitle: Text('Precio: \$${producto['precio']}'),
                  onTap: () {
                    // Aquí puedes agregar la navegación para ver detalles del producto
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
