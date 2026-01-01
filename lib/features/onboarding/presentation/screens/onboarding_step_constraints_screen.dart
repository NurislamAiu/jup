import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_option_tile.dart';
import 'package:jup/main.dart';
import 'package:provider/provider.dart';

class OnboardingStepConstraintsScreen extends StatefulWidget {
  const OnboardingStepConstraintsScreen({super.key});

  @override
  State<OnboardingStepConstraintsScreen> createState() => _OnboardingStepConstraintsScreenState();
}

class _OnboardingStepConstraintsScreenState extends State<OnboardingStepConstraintsScreen> {
  final List<OnboardingConstraint> _availableConstraints = [
    OnboardingConstraint(id: 'alcohol', name: 'Алкоголь'),
    OnboardingConstraint(id: 'activity', name: 'Активность'),
  ];
  
  final List<OnboardingConstraint> _selectedConstraints = [];

  void _toggleConstraint(OnboardingConstraint constraint) {
    setState(() {
      if (_selectedConstraints.any((c) => c.id == constraint.id)) {
        _selectedConstraints.removeWhere((c) => c.id == constraint.id);
      } else {
        _selectedConstraints.add(constraint);
      }
    });
  }

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
              'Есть ли у вас ограничения?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ..._availableConstraints.map((constraint) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: OnboardingOptionTile(
                title: constraint.name,
                isSelected: _selectedConstraints.any((c) => c.id == constraint.id),
                onTap: () => _toggleConstraint(constraint),
              ),
            )),
            const Spacer(),
            OnboardingNextButton(
              text: 'Завершить',
              isEnabled: true, // User can have no constraints
              onPressed: () async {
                final provider = context.read<OnboardingProvider>();
                for (var constraint in _selectedConstraints) {
                  provider.toggleConstraint(constraint);
                }
                await provider.finishOnboarding();
                
                if (mounted) {
                   Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
