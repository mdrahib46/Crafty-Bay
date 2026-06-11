import 'package:craftybay/app/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // _moveToNextScreen();
    super.initState();
  }

  // Future<void> _moveToNextScreen() async {
  //   await Future.delayed(Duration(seconds: 5));
  //   if (mounted) {
  //     Navigator.pushNamedAndRemoveUntil(
  //       context,
  //       MainBottomNavScreen.name,
  //       (route) => false,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: AppLogo()),

            /// Dummy Theme Changer\
            ThemeToggle(),

            const Spacer(),
            CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              'Version: 1.0',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeProvider>(
      builder: (context, _themeModeProvider, _) {
        return DropdownButton<ThemeMode>(

          value: _themeModeProvider.themeMode,
          items: [
            DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
            DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
            DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
          ],
          onChanged: (ThemeMode? newThemeMode) {
            _themeModeProvider.changeThemeMode(newThemeMode!);
          },
        );
      }
    );
  }
}
