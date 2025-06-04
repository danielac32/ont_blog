import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WidgetSummary extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/resumen1.jpeg',
    'assets/resumen2.jpeg',
    'assets/resumen3.jpeg',
    'assets/resumen4.jpeg',
    'assets/1.jpeg',
    'assets/2.jpeg',
    'assets/3.jpeg',
    'assets/4.jpeg',
    'assets/5.jpeg',
  ];

   WidgetSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width * 0.2;

    // Calcula el viewportFraction proporcional al ancho del item
    final double viewportFraction = itemWidth / MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Imagen de fondo
        Positioned.fill(
          child: Image.asset(
            'assets/banner_inf.jpg',
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.1), // opcional: oscurece la imagen para destacar el carrusel
            colorBlendMode: BlendMode.darken,
          ),
        ),

        // Carrusel encima de la imagen
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 300,
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: viewportFraction,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: false,
              initialPage: (imagePaths.length ~/ 2),
            ),
            items: imagePaths.map((path) {
              return Builder(
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        path,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}