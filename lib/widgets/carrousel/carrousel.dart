import 'package:flutter/material.dart';

class ResponsiveCarousel extends StatelessWidget {
  final List<String> imageUrls;

  const ResponsiveCarousel({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.6, // Altura del carrusel
      child: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Ejemplo de uso:
class MyHomePage extends StatelessWidget {
  final List<String> images = [
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Carousel'),
      ),
      body: Center(
        child: ResponsiveCarousel(imageUrls: images),
      ),
    );
  }
}
