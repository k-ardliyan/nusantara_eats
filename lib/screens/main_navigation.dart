import 'package:flutter/material.dart';
import 'package:nusantara_eats/screens/favorites_screen.dart';
import 'package:nusantara_eats/screens/home_screen.dart';
import 'package:nusantara_eats/screens/profile_screen.dart';
import 'package:nusantara_eats/theme/app_theme.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  Key _favoritesKey = UniqueKey();
  Key _profileKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final pages = [
      HeroMode(enabled: _currentIndex == 0, child: const HomeScreen()),
      HeroMode(
        enabled: _currentIndex == 1,
        child: FavoritesScreen(key: _favoritesKey),
      ),
      HeroMode(
        enabled: _currentIndex == 2,
        child: ProfileScreen(key: _profileKey),
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (value) => setState(() {
          _currentIndex = value;
          if (value == 1) {
            _favoritesKey =
                UniqueKey(); // rebuild favorites to reflect latest state
          }
          if (value == 2) {
            _profileKey =
                UniqueKey(); // rebuild profile to reflect latest state
          }
        }),
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.15),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
