import 'dart:convert';
import 'package:jup/features/onboarding/data/models/onboarding_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDataSource {
  Future<void> saveProfile(OnboardingProfileModel profile);
  Future<void> setOnboardingComplete();
  Future<bool> isOnboardingComplete();
}

const CACHED_ONBOARDING_PROFILE = 'CACHED_ONBOARDING_PROFILE';
const ONBOARDING_COMPLETE = 'ONBOARDING_COMPLETE';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnboardingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> isOnboardingComplete() {
    final isComplete = sharedPreferences.getBool(ONBOARDING_COMPLETE) ?? false;
    return Future.value(isComplete);
  }

  @override
  Future<void> saveProfile(OnboardingProfileModel profile) {
    return sharedPreferences.setString(
      CACHED_ONBOARDING_PROFILE,
      json.encode(profile.toJson()),
    );
  }

  @override
  Future<void> setOnboardingComplete() {
    return sharedPreferences.setBool(ONBOARDING_COMPLETE, true);
  }
}
