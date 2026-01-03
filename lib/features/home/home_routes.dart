import 'package:flutter/material.dart';
import 'package:jup/features/home/presentation/screens/home_screen.dart';

class HomeRoutes {
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomeScreen(),
    };
  }
}
