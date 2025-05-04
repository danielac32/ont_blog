

import 'package:flutter/material.dart';

class WidgetStatistic extends StatelessWidget {
  const WidgetStatistic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[800]!, Colors.blue[600]!],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'NUESTRO ALCANCE',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Statistic(number: '50', label: 'Organismos'),
              Statistic(number: '23', label: 'Gobernaciones'),
              Statistic(number: '300', label: 'Alcaldías'),
            ],
          ),
        ],
      ),
    );
  }
}
class Statistic extends StatelessWidget {
  const Statistic({super.key, required this.number, required this.label});
  final String number;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}