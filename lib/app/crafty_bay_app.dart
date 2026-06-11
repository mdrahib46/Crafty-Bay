import 'package:craftybay/app/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import 'app_theme.dart';
import 'routes.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeModeProvider())],
      child: Consumer<ThemeModeProvider>(
        builder: (context, themeModeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Crafty Bay",
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeModeProvider.themeMode,
            initialRoute: SplashScreen.name,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        }
      ),
    );
  }
}
