import 'package:flutter/material.dart';

class EmptyStateMoment extends StatelessWidget {
  const EmptyStateMoment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
        color: const Color(0xFFEADCD3), // Soft blush/rose accent
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Выравнивание всех элементов Column по центру
        children: [
          const Icon(
            Icons.favorite_border,
            color: Color(0xFF3D3632),
            size: 48,
          ),
          const SizedBox(height: 24),
          const Text(
            'Мы готовы, когда вы будете готовы.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D3632),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity, // Кнопка занимает всю доступную ширину
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4A373),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                elevation: 4,
                shadowColor: const Color(0xFFD4A373).withOpacity(0.4),
              ),
              child: const Text('Создайте свой момент', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity, // Кнопка занимает всю доступную ширину
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF3D3632),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              ),
              child: const Text(
                'Выберите готовый пакет',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}