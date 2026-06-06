import 'package:craftybay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crafty Bay",
      home: SplashScreen(),
    );
  }
}
