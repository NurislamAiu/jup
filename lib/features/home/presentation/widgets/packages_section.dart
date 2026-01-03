import 'package:flutter/material.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 32, 20, 12),
          child: Text(
            'Готовые Пакеты',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4B423F)),
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              SizedBox(width: 4),
              _PackageCard(
                title: 'Просто будьте вместе',
                description: 'Позвольте нам позаботиться обо всем.',
                color: Color(0xFFE3DCD7),
              ),
              _PackageCard(
                title: 'Тихий вечер',
                description: 'Никаких отвлечений, только вы.',
                color: Color(0xFFD7E0E3),
              ),
              _PackageCard(
                title: 'Спонтанное приключение',
                description: 'Когда вам нужна искра.',
                color: Color(0xFFE3D7D7),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PackageCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  const _PackageCard({required this.title, required this.description, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4B423F)),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                description,
                style: const TextStyle(fontSize: 16, color: Color(0xFF6B625F)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}