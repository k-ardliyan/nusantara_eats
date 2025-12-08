import 'package:flutter/material.dart';
import 'package:nusantara_eats/screens/favorites_screen.dart';
import 'package:nusantara_eats/screens/home_screen.dart';
import 'package:nusantara_eats/theme/app_theme.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  Key _favoritesKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final pages = [
      HeroMode(enabled: _currentIndex == 0, child: const HomeScreen()),
      HeroMode(
        enabled: _currentIndex == 1,
        child: FavoritesScreen(key: _favoritesKey),
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
          if (value == 1) {
            _favoritesKey =
                UniqueKey(); // rebuild favorites to reflect latest state
          }
        }),
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
        ],
      ),
    );
  }
}
