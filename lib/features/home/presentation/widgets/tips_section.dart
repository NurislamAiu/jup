import 'package:flutter/material.dart';

class TipsSection extends StatelessWidget {
  const TipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 32, 20, 12),
          child: Text(
            'Мысли об отношениях',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4B423F)),
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              SizedBox(width: 4),
              _TipCard(
                text: 'Иногда внимание важнее плана.',
              ),
              _TipCard(
                text: 'Небольшой сюрприз может создать большое воспоминание.',
              ),
              _TipCard(
                text: 'Умение слушать — это отдельная форма любви.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TipCard extends StatelessWidget {
  final String text;
  const _TipCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF5F1EE),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4B423F),
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}