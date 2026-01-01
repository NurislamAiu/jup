import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )
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
