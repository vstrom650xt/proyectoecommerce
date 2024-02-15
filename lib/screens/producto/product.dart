import 'package:flutter/material.dart';
import 'package:proyectoecommerce/widgets/card_producto/ProductCard.dart';
import 'package:proyectoecommerce/widgets/top_titles/top_titles.dart';

class product extends StatelessWidget {
  const product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TopTitles(subtitle: "", title: ""),
                SizedBox(
                    height:
                        20.0), // Espacio entre la barra de búsqueda y la tarjeta de producto
                const ProductCard(
                    nombre: "Nombre del Producto",
                    precio: 12.0,
                    imageUrl: "URL de la imagen"),
                const SizedBox(
                    height:
                        20.0), // Espacio entre la tarjeta de producto y el botón
                FloatingActionButton.extended(
                  onPressed: () {
                    // Acción al presionar el botón
                  },
                  label: const Text('Comprar'),
                  icon: const Icon(Icons.shop),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    label: const Text('Añadir al carrito'),
                    icon: const Icon(Icons.card_giftcard),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
