import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_option_tile.dart';
import 'package:provider/provider.dart';

class OnboardingStepFrequencyScreen extends StatefulWidget {
  const OnboardingStepFrequencyScreen({super.key});

  @override
  State<OnboardingStepFrequencyScreen> createState() => _OnboardingStepFrequencyScreenState();
}

class _OnboardingStepFrequencyScreenState extends State<OnboardingStepFrequencyScreen> {
  final OnboardingFrequency _frequency = OnboardingFrequency.onceAMonth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Как часто?',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Начнём с одного раза в месяц.',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 48),
          OnboardingOptionTile(
            title: 'Один раз в месяц',
            isSelected: true, // Always selected for MVP
            onTap: () {},
          ),
          const Spacer(),
          OnboardingNextButton(
            isEnabled: true,
            onPressed: () {
              context.read<OnboardingProvider>().setFrequency(_frequency);
              context.read<OnboardingProvider>().nextPage();
            },
          ),
        ],
      ),
    );
  }
}
