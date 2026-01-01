import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:provider/provider.dart';

class OnboardingIntroWelcomeScreen extends StatelessWidget {
  const OnboardingIntroWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // Placeholder for a beautiful illustration or animation
          Icon(
            Icons.auto_awesome,
            size: 100,
            color: theme.primaryColor,
          ),
          const SizedBox(height: 40),
          Text(
            'Откройте магию моментов',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'JUP убирает рутину из отношений, оставляя только лучшие впечатления.',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const Spacer(),
          const Spacer(),
          OnboardingNextButton(
            text: 'Как это работает?',
            isEnabled: true,
            onPressed: () {
              context.read<OnboardingProvider>().nextPage();
            },
          ),
        ],
      ),
    );
  }
}
