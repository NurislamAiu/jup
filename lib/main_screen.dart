import 'package:flutter/material.dart';
import 'package:jup/features/home/presentation/screens/home_screen.dart'; // Import your existing home screen
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart'; // Import the salomon_bottom_bar package

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(), // 0: Home Screen
    const Center(child: Text('Discover Screen')), // 1: Discover Screen
    const Center(child: Text('Profile Screen')), // 2: Profile Screen
    const Center(child: Text('Favorites Screen')), // 3: Favorites Screen
    const Center(child: Text('Settings Screen')), // 4: Settings Screen
  ];

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: SalomonBottomBar(
            currentIndex: _selectedIndex,
            onTap: (i) => setState(() => _selectedIndex = i),
            selectedItemColor: primaryColor,
            unselectedItemColor: Theme.of(context).colorScheme.onSurface,
            itemPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            selectedColorOpacity: 0.2,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                selectedColor: primaryColor,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.explore_outlined),
                title: const Text('Discover'),
                selectedColor: primaryColor,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person_outlined),
                title: const Text('Profile'),
                selectedColor: primaryColor,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_outlined),
                title: const Text('Favorites'),
                selectedColor: primaryColor,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                selectedColor: primaryColor,
              ),
            ],
          ),
      ),
    );
  }
}
