import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AiAssistantCard extends StatelessWidget {
  const AiAssistantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF4B423F), // Soft dark color
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          const Icon(CupertinoIcons.heart_circle, color: Color(0xFFE5BDB2), size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Поговорить с JUP AI',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'Не уверены, что сейчас нужно вашим отношениям?',
                  style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          Icon(CupertinoIcons.chevron_forward, color: Colors.white.withOpacity(0.7)),
        ],
      ),
    );
  }
}
