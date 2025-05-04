
import 'package:flutter/material.dart';

class WidgetSummary extends StatelessWidget {
  const WidgetSummary({
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
}