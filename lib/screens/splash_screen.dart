import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nusantara_eats/screens/main_navigation.dart';
import 'package:nusantara_eats/screens/onboarding_screen.dart';
import 'package:nusantara_eats/services/favorite_storage.dart';
import 'package:nusantara_eats/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nusantara_eats/data/recipe_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    bool hasOnboarded = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      hasOnboarded = prefs.getBool('hasOnboarded') ?? false;
      // hydrate favorites before navigation so list states are consistent
      await FavoriteStorage.applyToRecipes(recipes);
    } catch (e) {
      debugPrint('SharedPreferences init failed: $e');
    }

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    final next = hasOnboarded
        ? const MainNavigation()
        : const OnboardingScreen();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => next));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.primaryColor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: Colors.white.a * 0.85),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.restaurant,
                  color: AppTheme.primaryColor,
                  size: 48,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Nusantara Eats',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
