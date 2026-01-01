import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_constraints_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_family_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_frequency_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_surprise_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_type_screen.dart';
import 'package:provider/provider.dart';

class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  late final PageController _pageController;

  final List<Widget> _screens = const [
    OnboardingStepTypeScreen(),
    OnboardingStepFamilyScreen(),
    OnboardingStepFrequencyScreen(),
    OnboardingStepSurpriseScreen(),
    OnboardingStepConstraintsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    context.read<OnboardingProvider>().addListener(_onPageChange);
  }

  @override
  void dispose() {
    context.read<OnboardingProvider>().removeListener(_onPageChange);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChange() {
    _pageController.animateToPage(
      context.read<OnboardingProvider>().currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: context.watch<OnboardingProvider>().currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.read<OnboardingProvider>().previousPage(),
              )
            : null,
        title: const Text('JUP'),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
    );
  }
}
