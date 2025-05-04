
import 'package:flutter/material.dart';

class WidgetGraph extends StatelessWidget {
  const WidgetGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'GRÁFICA DE TORTA AQUÍ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PROGRAMACIÓN FINANCIERA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                LegendItem(text: 'Presupuesto asignado',color: Colors.blue),
                LegendItem(text: 'Ejecutado',color: Colors.green),
                LegendItem(text: 'Pendiente',color: Colors.orange),
                LegendItem(text: 'Ajustes',color: Colors.red),
                const SizedBox(height: 20),
                const Text(
                  'Nuestra programación financiera se basa en principios de transparencia y eficiencia, garantizando el uso óptimo de los recursos para el cumplimiento de nuestros objetivos institucionales.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class LegendItem extends StatelessWidget {
  const LegendItem({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

