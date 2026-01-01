import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:provider/provider.dart';

class OnboardingIntroPersonalizationScreen extends StatelessWidget {
  const OnboardingIntroPersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/intro_personalization.png',
            height: 200, // Adjust the size as needed
             errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.tune, size: 100), // Placeholder on error
          ),
          const SizedBox(height: 40),
          Text(
            'Всего несколько вопросов',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Это займёт не больше минуты и поможет нам создавать моменты, которые идеально подходят именно вам.',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const Spacer(),
          const Spacer(),
          OnboardingNextButton(
            text: 'Начать настройку',
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
