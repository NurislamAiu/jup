import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jup/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:jup/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:jup/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:jup/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:jup/features/onboarding/domain/usecases/save_onboarding_profile.dart';
import 'package:jup/features/onboarding/onboarding_routes.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// A simple DI/Service Locator setup
Future<Map<String, dynamic>> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final OnboardingLocalDataSource localDataSource =
      OnboardingLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  final OnboardingRepository repository =
      OnboardingRepositoryImpl(localDataSource: localDataSource);

  final saveOnboardingProfile = SaveOnboardingProfile(repository);
  final completeOnboarding = CompleteOnboarding(repository);

  final onboardingProvider = OnboardingProvider(
    saveOnboardingProfile: saveOnboardingProfile,
    completeOnboarding: completeOnboarding,
  );

  final bool isOnboardingComplete = await repository.isOnboardingComplete();

  return {
    'onboardingProvider': onboardingProvider,
    'isOnboardingComplete': isOnboardingComplete,
  };
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = await setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<OnboardingProvider>.value(
            value: dependencies['onboardingProvider']),
      ],
      child: MyApp(isOnboardingComplete: dependencies['isOnboardingComplete']),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isOnboardingComplete;
  const MyApp({super.key, required this.isOnboardingComplete});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JUP',
      theme: ThemeData(
        primaryColor: const Color(0xFFE94057),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFE94057), // Vibrant Pink
          secondary: Color(0xFFF27121), // Orange accent for gradients
          onPrimary: Colors.white,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFFFFFFFF),
          iconTheme: IconThemeData(color: Color(0xFF323755)),
          titleTextStyle: TextStyle(
              color: Color(0xFF323755), fontSize: 20, fontWeight: FontWeight.bold),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:
          isOnboardingComplete ? HomeScreen.routeName : OnboardingRoutes.onboardingFlow,
      routes: {
        ...OnboardingRoutes.routes,
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}

// Placeholder for the main screen after onboarding
class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главный экран'),
      ),
      body: const Center(
        child: Text('Добро пожаловать в JUP!'),
      ),
    );
  }
}
