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
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D3632),
              letterSpacing: 0.2,
            ),
          ),
        ),
        SizedBox(
          height: 130, // Увеличена высота для карточек, чтобы избежать переполнения
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              SizedBox(width: 8),
              _EventCard(
                title: 'Настроение',
                assetPath: 'assets/images/mood.png',
              ),
              SizedBox(width: 8),
              _EventCard(
                title: 'Место',
                assetPath: 'assets/images/location.png',
              ),
              SizedBox(width: 8),
              _EventCard(
                title: 'Энергия',
                assetPath: 'assets/images/energy.png',
              ),
              SizedBox(width: 8),
              _EventCard(
                title: 'Сюрприз',
                assetPath: 'assets/images/icon_surprise.png',
              ),
              SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String assetPath;

  const _EventCard({super.key, required this.title, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          highlightColor: const Color(0xFFD4A373).withOpacity(0.08),
          splashColor: const Color(0xFFD4A373).withOpacity(0.15),
          onTap: () {
            print('Нажата карточка: $title');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(assetPath, width: 46, height: 46),
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3D3632),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
