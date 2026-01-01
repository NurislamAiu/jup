
enum OnboardingType { couple, family }

enum OnboardingFrequency { onceAMonth }

enum OnboardingSurpriseLevel { low, medium, high }

class OnboardingConstraint {
  final String id;
  final String name;

  OnboardingConstraint({required this.id, required this.name});
}

class OnboardingProfile {
  final OnboardingType type;
  final bool hasChildren;
  final OnboardingFrequency frequency;
  final OnboardingSurpriseLevel surpriseLevel;
  final List<OnboardingConstraint> constraints;

  OnboardingProfile({
    required this.type,
    required this.hasChildren,
    required this.frequency,
    required this.surpriseLevel,
    required this.constraints,
  });
}
