import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_option_tile.dart';
import 'package:provider/provider.dart';

class OnboardingStepFamilyScreen extends StatefulWidget {
  const OnboardingStepFamilyScreen({super.key});

  @override
  State<OnboardingStepFamilyScreen> createState() => _OnboardingStepFamilyScreenState();
}

class _OnboardingStepFamilyScreenState extends State<OnboardingStepFamilyScreen> {
  bool? _hasChildren;

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
              'У вас есть дети?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            OnboardingOptionTile(
              title: 'Да',
              isSelected: _hasChildren == true,
              onTap: () => setState(() => _hasChildren = true),
            ),
            const SizedBox(height: 16),
            OnboardingOptionTile(
              title: 'Нет',
              isSelected: _hasChildren == false,
              onTap: () => setState(() => _hasChildren = false),
            ),
            const Spacer(),
            OnboardingNextButton(
              isEnabled: _hasChildren != null,
              onPressed: () {
                if (_hasChildren != null) {
                  context.read<OnboardingProvider>().setHasChildren(_hasChildren!);
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
