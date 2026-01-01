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
    final theme = Theme.of(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Для кого JUP?',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Выберите подходящий формат.',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 48),
          OnboardingOptionTile(
            title: 'Для пары',
            isSelected: _selectedType == OnboardingType.couple,
            onTap: () => setState(() => _selectedType = OnboardingType.couple),
          ),
          const SizedBox(height: 20),
          OnboardingOptionTile(
            title: 'Для семьи',
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
    );
  }
}
