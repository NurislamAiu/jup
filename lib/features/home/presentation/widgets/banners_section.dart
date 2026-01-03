import 'package:flutter/material.dart';

class BannersSection extends StatelessWidget {
  const BannersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 32, 20, 12),
          child: Text(
            'Забота и Внимание',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4B423F)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              _BannerCard(title: 'Цветы и Забота', icon: Icons.filter_vintage_outlined),
              SizedBox(height: 12),
              _BannerCard(title: 'Адвент-календари', icon: Icons.calendar_today_outlined),
              SizedBox(height: 12),
              _BannerCard(title: 'Домашние впечатления', icon: Icons.home_outlined),
            ],
          ),
        ),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const _BannerCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF4B423F), size: 28),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF4B423F)),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF4B423F), size: 16),
          ],
        ),
      ),
    );
  }
}