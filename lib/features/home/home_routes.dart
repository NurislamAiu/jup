import 'package:flutter/material.dart';
import 'package:jup/features/home/presentation/screens/home_screen.dart';
import 'package:jup/main_screen.dart'; // Import the new MainScreen

class HomeRoutes {
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const MainScreen(), // Use MainScreen as the entry point for home route
    };
  }
}
