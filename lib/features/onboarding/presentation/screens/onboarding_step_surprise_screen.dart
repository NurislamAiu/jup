import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_option_tile.dart';
import 'package:provider/provider.dart';

class OnboardingStepSurpriseScreen extends StatefulWidget {
  const OnboardingStepSurpriseScreen({super.key});

  @override
  State<OnboardingStepSurpriseScreen> createState() => _OnboardingStepSurpriseScreenState();
}

class _OnboardingStepSurpriseScreenState extends State<OnboardingStepSurpriseScreen> {
  OnboardingSurpriseLevel? _selectedLevel;

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
            'Уровень сюрприза?',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Насколько вы готовы довериться нам?',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 48),
          OnboardingOptionTile(
            title: 'Низкий',
            isSelected: _selectedLevel == OnboardingSurpriseLevel.low,
            onTap: () => setState(() => _selectedLevel = OnboardingSurpriseLevel.low),
          ),
          const SizedBox(height: 20),
          OnboardingOptionTile(
            title: 'Средний',
            isSelected: _selectedLevel == OnboardingSurpriseLevel.medium,
            onTap: () => setState(() => _selectedLevel = OnboardingSurpriseLevel.medium),
          ),
          const SizedBox(height: 20),
          OnboardingOptionTile(
            title: 'Высокий',
            isSelected: _selectedLevel == OnboardingSurpriseLevel.high,
            onTap: () => setState(() => _selectedLevel = OnboardingSurpriseLevel.high),
          ),
          const Spacer(),
          OnboardingNextButton(
            isEnabled: _selectedLevel != null,
            onPressed: () {
              if (_selectedLevel != null) {
                context.read<OnboardingProvider>().setSurpriseLevel(_selectedLevel!);
                context.read<OnboardingProvider>().nextPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
