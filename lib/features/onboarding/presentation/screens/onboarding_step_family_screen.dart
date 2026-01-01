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
    final theme = Theme.of(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'У вас есть дети?',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Это поможет нам подобрать правильные моменты.',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 48),
          OnboardingOptionTile(
            title: 'Да, есть',
            isSelected: _hasChildren == true,
            onTap: () => setState(() => _hasChildren = true),
          ),
          const SizedBox(height: 20),
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
    );
  }
}
