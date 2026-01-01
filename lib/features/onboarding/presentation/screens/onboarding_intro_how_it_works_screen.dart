import 'package:flutter/material.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:jup/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:provider/provider.dart';

class OnboardingIntroHowItWorksScreen extends StatelessWidget {
  const OnboardingIntroHowItWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 1),
          Text(
            'Всего 3 шага\nк идеальному моменту',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF323755),
            ),
          ),
          const SizedBox(height: 48),
          _buildStep(
            context,
            assetPath: 'assets/images/icon_form.png',
            title: 'Шаг 1: Анкета',
            subtitle: 'Вы отвечаете на несколько вопросов, чтобы мы узнали вас лучше.',
          ),
          const SizedBox(height: 32),
          _buildStep(
            context,
            assetPath: 'assets/images/icon_surprise.png',
            title: 'Шаг 2: Сюрприз',
            subtitle: 'Мы готовим уникальное событие, держа детали в секрете до нужного часа.',
          ),
          const SizedBox(height: 32),
          _buildStep(
            context,
            assetPath: 'assets/images/icon_enjoy.png',
            title: 'Шаг 3: Наслаждение',
            subtitle: 'Вы просто приходите в назначенное время и наслаждаетесь моментом.',
          ),
          const Spacer(flex: 2),
          OnboardingNextButton(
            text: 'Звучит отлично!',
            isEnabled: true,
            onPressed: () {
              context.read<OnboardingProvider>().nextPage();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStep(BuildContext context, {required String assetPath, required String title, required String subtitle}) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(assetPath, height: 40, width: 40),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF323755),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
