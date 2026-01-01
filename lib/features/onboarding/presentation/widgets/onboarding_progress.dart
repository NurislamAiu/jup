import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';

class OnboardingProgress extends StatelessWidget {
  final int totalSteps;

  const OnboardingProgress({super.key, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, provider, child) {
        return LinearProgressIndicator(
          value: (provider.currentPage + 1) / totalSteps,
          backgroundColor: Colors.grey[200],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        );
      },
    );
  }
}
