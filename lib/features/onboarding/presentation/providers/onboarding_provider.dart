import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';
import 'package:jup/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:jup/features/onboarding/domain/usecases/save_onboarding_profile.dart';

class OnboardingProvider with ChangeNotifier {
  final SaveOnboardingProfile saveOnboardingProfile;
  final CompleteOnboarding completeOnboarding;

  OnboardingProvider({
    required this.saveOnboardingProfile,
    required this.completeOnboarding,
  });

  int _currentPage = 0;
  int get currentPage => _currentPage;

  late OnboardingType _type;
  late bool _hasChildren;
  late OnboardingFrequency _frequency;
  late OnboardingSurpriseLevel _surpriseLevel;
  final List<OnboardingConstraint> _constraints = [];

  void setType(OnboardingType type) {
    _type = type;
    notifyListeners();
  }

  void setHasChildren(bool hasChildren) {
    _hasChildren = hasChildren;
    notifyListeners();
  }

  void setFrequency(OnboardingFrequency frequency) {
    _frequency = frequency;
    notifyListeners();
  }

  void setSurpriseLevel(OnboardingSurpriseLevel surpriseLevel) {
    _surpriseLevel = surpriseLevel;
    notifyListeners();
  }

  void toggleConstraint(OnboardingConstraint constraint) {
    if (_constraints.any((c) => c.id == constraint.id)) {
      _constraints.removeWhere((c) => c.id == constraint.id);
    } else {
      _constraints.add(constraint);
    }
    notifyListeners();
  }

  void nextPage() {
    _currentPage++;
    notifyListeners();
  }

  void previousPage() {
    _currentPage--;
    notifyListeners();
  }

  Future<void> finishOnboarding() async {
    final profile = OnboardingProfile(
      type: _type,
      hasChildren: _hasChildren,
      frequency: _frequency,
      surpriseLevel: _surpriseLevel,
      constraints: _constraints,
    );
    await saveOnboardingProfile(profile);
    await completeOnboarding();
  }
}
