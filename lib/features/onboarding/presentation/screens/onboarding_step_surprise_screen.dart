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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Какой уровень сюрприза вам нравится?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            OnboardingOptionTile(
              title: 'Низкий',
              isSelected: _selectedLevel == OnboardingSurpriseLevel.low,
              onTap: () => setState(() => _selectedLevel = OnboardingSurpriseLevel.low),
            ),
            const SizedBox(height: 16),
            OnboardingOptionTile(
              title: 'Средний',
              isSelected: _selectedLevel == OnboardingSurpriseLevel.medium,
              onTap: () => setState(() => _selectedLevel = OnboardingSurpriseLevel.medium),
            ),
            const SizedBox(height: 16),
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
      ),
    );
  }
}
