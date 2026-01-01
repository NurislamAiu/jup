import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:provider/provider.dart';

class OnboardingWelcomeScreen extends StatelessWidget {
  const OnboardingWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          // Placeholder for a Lottie animation or a beautiful illustration
          Icon(
            Icons.favorite_rounded,
            size: 100,
            color: theme.primaryColor.withOpacity(0.8),
          ),
          const SizedBox(height: 40),
          Text(
            'Добро пожаловать в JUP',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Приложение, которое убирает решения из отношений и добавляет магии.',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const Spacer(),
          const Spacer(),
          OnboardingNextButton(
            text: 'Начать',
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
