import 'package:flutter/material.dart';

class ResponsiveCarousel extends StatelessWidget {
  final List<String> imageUrls;

  const ResponsiveCarousel({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SizedBox(
          height: screenWidth *
              0.158, // Altura del carrusel ajustada al 40% del ancho de la pantalla
          child: PageView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5, vertical: 5), ////////////
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
