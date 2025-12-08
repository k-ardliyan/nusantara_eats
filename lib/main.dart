import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nusantara_eats/screens/splash_screen.dart';
import 'package:nusantara_eats/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const NusantaraEatsApp());
}

class NusantaraEatsApp extends StatelessWidget {
  const NusantaraEatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusantara Eats',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
