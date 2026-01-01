import 'package:flutter/material.dart';

class OnboardingNextButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final String text;

  const OnboardingNextButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
    this.text = 'Далее',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: isEnabled ? Colors.blueAccent : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
