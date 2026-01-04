import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jup/features/home/data/datasources/home_remote_data_source.dart';
import 'package:jup/features/home/data/repositories/home_repository_impl.dart';
import 'package:jup/features/home/domain/repositories/home_repository.dart';
import 'package:jup/features/home/domain/usecases/get_next_moment.dart';
import 'package:jup/features/home/home_routes.dart';
import 'package:jup/features/home/presentation/providers/home_provider.dart';
import 'package:jup/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:jup/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:jup/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:jup/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:jup/features/onboarding/domain/usecases/save_onboarding_profile.dart';
import 'package:jup/features/onboarding/onboarding_routes.dart';
import 'package:jup/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jup/features/packages/packages_routes.dart'; // Import new packages routes

// DI Setup remains the same...
Future<Map<String, dynamic>> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final onboardingLocalDataSource = OnboardingLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  final onboardingRepository = OnboardingRepositoryImpl(localDataSource: onboardingLocalDataSource);
  final saveOnboardingProfile = SaveOnboardingProfile(onboardingRepository);
  final completeOnboarding = CompleteOnboarding(onboardingRepository);
  final homeRemoteDataSource = HomeRemoteDataSourceImpl();
  final homeRepository = HomeRepositoryImpl(remoteDataSource: homeRemoteDataSource);
  final getNextMoment = GetNextMoment(homeRepository);
  final bool isOnboardingComplete = await onboardingRepository.isOnboardingComplete();
  return {
    'onboardingProvider': OnboardingProvider(saveOnboardingProfile: saveOnboardingProfile, completeOnboarding: completeOnboarding),
    'homeProvider': HomeProvider(getNextMoment: getNextMoment),
    'isOnboardingComplete': isOnboardingComplete,
  };
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru', null);
  final dependencies = await setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<OnboardingProvider>.value(value: dependencies['onboardingProvider']),
        ChangeNotifierProvider<HomeProvider>.value(value: dependencies['homeProvider']),
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
    const Color primaryText = Color(0xFF4B423F); // Soft dark text
    const Color accentColor = Color(0xFFC78B7F); // A slightly darker, more visible dusty rose
    const Color bgColor = Color(0xFFFBF9F4); // Warm ivory

    return MaterialApp(
      title: 'JUP',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primaryColor: accentColor,
        textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: primaryText,
          displayColor: primaryText,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: bgColor,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryText),
        ),
        colorScheme: const ColorScheme.light(
          primary: accentColor,
          secondary: primaryText,
          onPrimary: Colors.white,
          background: bgColor,
        ),
      ),
      initialRoute: isOnboardingComplete ? HomeRoutes.home : OnboardingRoutes.onboardingFlow,
      routes: {
        ...OnboardingRoutes.routes,
        ...HomeRoutes.routes,
        ...PackagesRoutes.routes, // Add packages routes
      },
    );
  }
}
