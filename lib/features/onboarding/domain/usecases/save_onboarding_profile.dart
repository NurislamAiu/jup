import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';
import 'package:jup/features/onboarding/domain/repositories/onboarding_repository.dart';

class SaveOnboardingProfile {
  final OnboardingRepository repository;

  SaveOnboardingProfile(this.repository);

  Future<void> call(OnboardingProfile profile) {
    return repository.saveProfile(profile);
  }
}
