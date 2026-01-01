import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_intro_how_it_works_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_intro_personalization_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_intro_welcome_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_constraints_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_family_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_frequency_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_surprise_screen.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_step_type_screen.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_progress.dart';
import 'package:provider/provider.dart';

class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  late final PageController _pageController;
  late final OnboardingProvider _provider;

  final List<Widget> _screens = const [
    // Intro screens
    OnboardingIntroWelcomeScreen(),
    OnboardingIntroHowItWorksScreen(),
    OnboardingIntroPersonalizationScreen(),
    // Questionnaire screens
    OnboardingStepTypeScreen(),
    OnboardingStepFamilyScreen(),
    OnboardingStepFrequencyScreen(),
    OnboardingStepSurpriseScreen(),
    OnboardingStepConstraintsScreen(),
  ];

  static const int _introScreensCount = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Get the provider reference here, when the context is active.
    _provider = context.read<OnboardingProvider>();
    _provider.addListener(_onPageChange);
  }

  @override
  void dispose() {
    // Use the stored provider reference to safely remove the listener.
    _provider.removeListener(_onPageChange);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChange() {
    _pageController.animateToPage(
      context.read<OnboardingProvider>().currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();
    final isIntro = provider.currentPage < _introScreensCount;
    final isQuestionnaire = !isIntro;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade50,
              Colors.blue.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                height: 60,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isQuestionnaire
                      ? _buildQuestionnaireHeader(provider)
                      : _buildIntroHeader(provider),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _screens,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroHeader(OnboardingProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_introScreensCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == provider.currentPage ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == provider.currentPage
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildQuestionnaireHeader(OnboardingProvider provider) {
    return Row(
      children: [
        SizedBox(
          width: 64,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.grey[800],
            onPressed: () => context.read<OnboardingProvider>().previousPage(),
          ),
        ),
        Expanded(
          child: OnboardingProgress(
            totalSteps: _screens.length - _introScreensCount,
            currentStep: provider.currentPage - _introScreensCount,
          ),
        ),
        const SizedBox(width: 64), // for alignment
      ],
    );
  }
}
