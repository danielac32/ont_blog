
import 'package:flutter/material.dart';


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
    return Container(
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
                height:  MediaQuery.of(context).size.height * 0.2,
                width:  MediaQuery.of(context).size.width * 0.2,
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
    );
  }
}

/*
class WidgetSummary extends StatelessWidget {
  const WidgetSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.height,
      width:  MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.grey[100],
      child: Column(
        children: [
          const Text(
            'RESUMEN DE GESTIÓN',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ManagementCard(
                title: 'Proyectos completados',
                value: '48',
                icon: Icons.check_circle,
                color: Colors.green,
              ),
              ManagementCard(
                title: 'Proyectos en curso',
                value: '15',
                icon: Icons.construction,
                color: Colors.orange,
              ),
              ManagementCard(
                title: 'Capacitaciones realizadas',
                value: '32',
                icon: Icons.school,
                color: Colors.blue,
              ),
              ManagementCard(
                title: 'Beneficiarios directos',
                value: '1,250',
                icon: Icons.people,
                color: Colors.purple,
              ),
              ManagementCard(
                title: 'Aliados estratégicos',
                value: '28',
                icon: Icons.handshake,
                color: Colors.teal,
              ),
              ManagementCard(
                title: 'Inversión total',
                value: '\$2.8M',
                icon: Icons.attach_money,
                color: Colors.green[700]!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ManagementCard extends StatelessWidget {
  const ManagementCard({super.key, required this.title, required this.value, required this.icon, required this.color});
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/