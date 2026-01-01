import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/screens/onboarding_flow_screen.dart';

class OnboardingRoutes {
  static const String onboardingFlow = '/onboarding';

  static Map<String, WidgetBuilder> get routes {
    return {
      onboardingFlow: (context) => const OnboardingFlowScreen(),
    };
  }
}
