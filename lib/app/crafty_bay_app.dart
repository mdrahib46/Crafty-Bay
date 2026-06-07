import 'package:flutter/material.dart';

import 'package:craftybay/app/routes.dart';
import 'package:craftybay/features/auth/presentation/screens/splash_screen.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crafty Bay",
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
