import 'package:flutter/material.dart';
import 'package:jup/features/home/home_routes.dart';
import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_option_tile.dart';
import 'package:provider/provider.dart';

class OnboardingStepConstraintsScreen extends StatefulWidget {
  const OnboardingStepConstraintsScreen({super.key});

  @override
  State<OnboardingStepConstraintsScreen> createState() => _OnboardingStepConstraintsScreenState();
}

class _OnboardingStepConstraintsScreenState extends State<OnboardingStepConstraintsScreen> {
  final List<OnboardingConstraint> _availableConstraints = [
    OnboardingConstraint(id: 'alcohol', name: 'Без алкоголя'),
    OnboardingConstraint(id: 'activity', name: 'Спокойный отдых'),
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
    final theme = Theme.of(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ограничения?',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Выберите, если что-то не подходит.',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 48),
          ..._availableConstraints.map((constraint) => Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
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
                   Navigator.of(context).pushReplacementNamed(HomeRoutes.home);
                }
              },
            ),
        ],
      ),
    );
  }
}
