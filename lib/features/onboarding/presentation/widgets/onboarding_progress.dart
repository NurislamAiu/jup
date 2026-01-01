import 'package:flutter/material.dart';

class OnboardingProgress extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const OnboardingProgress({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        bool isActive = index == currentStep;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 10,
          width: isActive ? 30 : 10,
          decoration: BoxDecoration(
            color: isActive ? theme.primaryColor : Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
