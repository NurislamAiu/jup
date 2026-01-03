import 'package:flutter/material.dart';

class CreateEventSection extends StatelessWidget {
  const CreateEventSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Text(
            'Создайте Момент',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3D3632)),
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              SizedBox(width: 4),
              _EventCard(title: 'Настроение', icon: Icons.sentiment_satisfied_alt_outlined),
              _EventCard(title: 'Место', icon: Icons.location_on_outlined),
              _EventCard(title: 'Энергия', icon: Icons.flash_on_outlined),
              _EventCard(title: 'Сюрприз', icon: Icons.star_border_outlined),
            ],
          ),
        ),
      ],
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const _EventCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F1EE),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEAE2DD), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF3D3632), size: 36),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF3D3632), fontSize: 15),
          ),
        ],
      ),
    );
  }
}