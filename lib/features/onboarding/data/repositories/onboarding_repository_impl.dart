import 'package:jup/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:jup/features/onboarding/data/models/onboarding_profile_model.dart';
import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';
import 'package:jup/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl({required this.localDataSource});

  @override
  Future<void> completeOnboarding() {
    return localDataSource.setOnboardingComplete();
  }

  @override
  Future<bool> isOnboardingComplete() {
    return localDataSource.isOnboardingComplete();
  }

  @override
  Future<void> saveProfile(OnboardingProfile profile) {
    final profileModel = OnboardingProfileModel.fromEntity(profile);
    return localDataSource.saveProfile(profileModel);
  }
}
