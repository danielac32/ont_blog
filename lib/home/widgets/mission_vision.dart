import 'package:flutter/material.dart';

class WidgetMissionVision extends StatelessWidget {
  const WidgetMissionVision({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.grey[100],
      child: Column(
        children: [
          const Text(
            'QUIÉNES SOMOS',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCard(
                title: 'MISIÓN',
                content: 'Nuestra misión es proporcionar soluciones innovadoras y eficientes para el desarrollo organizacional y tecnológico.',
                icon: Icons.flag,
              ),
              InfoCard(
                title:'VISIÓN',
                content:'Ser líderes en transformación digital y gestión organizacional a nivel nacional e internacional.',
                icon:Icons.visibility,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCard(
                title:'VALORES',
                content:'Integridad, Innovación, Excelencia, Trabajo en equipo, Responsabilidad social.',
                icon:Icons.star,
              ),
              InfoCard(
                title:'OBJETIVO',
                content:'Fortalecer las capacidades institucionales mediante soluciones tecnológicas y de gestión.',
                icon:Icons.track_changes,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class InfoCard extends StatelessWidget {
  InfoCard({super.key, required this.title, required this.content, required this.icon});
  final String title;
  final String content;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.blue,
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}