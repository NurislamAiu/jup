import 'package:jup/features/onboarding/domain/entities/onboarding_profile.dart';

class OnboardingProfileModel extends OnboardingProfile {
  OnboardingProfileModel({
    required super.type,
    required super.hasChildren,
    required super.frequency,
    required super.surpriseLevel,
    required super.constraints,
  });

  factory OnboardingProfileModel.fromEntity(OnboardingProfile entity) {
    return OnboardingProfileModel(
      type: entity.type,
      hasChildren: entity.hasChildren,
      frequency: entity.frequency,
      surpriseLevel: entity.surpriseLevel,
      constraints: entity.constraints,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'hasChildren': hasChildren,
      'frequency': frequency.toString().split('.').last,
      'surpriseLevel': surpriseLevel.toString().split('.').last,
      'constraints': constraints.map((c) => {'id': c.id, 'name': c.name}).toList(),
    };
  }

  factory OnboardingProfileModel.fromJson(Map<String, dynamic> json) {
    return OnboardingProfileModel(
      type: OnboardingType.values.firstWhere((e) => e.toString().split('.').last == json['type']),
      hasChildren: json['hasChildren'],
      frequency: OnboardingFrequency.values.firstWhere((e) => e.toString().split('.').last == json['frequency']),
      surpriseLevel: OnboardingSurpriseLevel.values.firstWhere((e) => e.toString().split('.').last == json['surpriseLevel']),
      constraints: (json['constraints'] as List)
          .map((c) => OnboardingConstraint(id: c['id'], name: c['name']))
          .toList(),
    );
  }
}
