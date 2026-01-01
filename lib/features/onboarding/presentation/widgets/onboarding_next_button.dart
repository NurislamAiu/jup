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
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: isEnabled
            ? LinearGradient(
                colors: [theme.colorScheme.secondary, theme.primaryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: theme.primaryColor.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ]
            : [],
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isEnabled ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
