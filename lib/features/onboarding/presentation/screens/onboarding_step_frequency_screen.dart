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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Как часто вы хотите проводить время вместе?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            OnboardingOptionTile(
              title: '1 раз в месяц',
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
      ),
    );
  }
}
