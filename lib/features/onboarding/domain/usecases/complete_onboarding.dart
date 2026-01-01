import 'package:jup/features/onboarding/domain/repositories/onboarding_repository.dart';

class CompleteOnboarding {
  final OnboardingRepository repository;

  CompleteOnboarding(this.repository);

  Future<void> call() {
    return repository.completeOnboarding();
  }
}
