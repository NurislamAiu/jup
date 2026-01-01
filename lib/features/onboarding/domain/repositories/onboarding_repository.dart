import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';

abstract class OnboardingRepository {
  Future<void> saveProfile(OnboardingProfile profile);
  Future<void> completeOnboarding();
  Future<bool> isOnboardingComplete();
}
