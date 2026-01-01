import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_option_tile.dart';
import 'package:provider/provider.dart';

class OnboardingStepTypeScreen extends StatefulWidget {
  const OnboardingStepTypeScreen({super.key});

  @override
  State<OnboardingStepTypeScreen> createState() => _OnboardingStepTypeScreenState();
}

class _OnboardingStepTypeScreenState extends State<OnboardingStepTypeScreen> {
  OnboardingType? _selectedType;

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
              'Какой формат вам подходит?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            OnboardingOptionTile(
              title: 'Пара',
              isSelected: _selectedType == OnboardingType.couple,
              onTap: () => setState(() => _selectedType = OnboardingType.couple),
            ),
            const SizedBox(height: 16),
            OnboardingOptionTile(
              title: 'Семья',
              isSelected: _selectedType == OnboardingType.family,
              onTap: () => setState(() => _selectedType = OnboardingType.family),
            ),
            const Spacer(),
            OnboardingNextButton(
              isEnabled: _selectedType != null,
              onPressed: () {
                if (_selectedType != null) {
                  context.read<OnboardingProvider>().setType(_selectedType!);
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
