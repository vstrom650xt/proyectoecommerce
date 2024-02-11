import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String subtitle;
  final String title;

  const TopTitles({Key? key, required this.subtitle, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "lib/img/login.png",
              height: 50, // Altura deseada del logo
              width: 50, // Ancho deseado del logo
            ),
            const SizedBox(width: 10), // Espacio entre el logo y el título
            Text(
              title,
              style: const TextStyle(
                fontSize: 20, // Tamaño de fuente del título
                fontWeight: FontWeight.bold, // Peso de la fuente del título
              ),
            ),
          ],
        ),
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
                //    Icon(Icons.search), // Icono de búsqueda
                SizedBox(width: 10), // Espacio entre el icono y el texto
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
                  tooltip: 'Increase volume by 10',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
