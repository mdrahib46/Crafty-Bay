
import 'package:craftybay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:craftybay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../shared/presentation/widgets/theme_toggle.dart';
import '../../../shared/presentation/widgets/toggle_language.dart';
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
    _moveToNextScreen();
    super.initState();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 5));
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInScreen.name,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: AppLogo()),


            ThemeToggle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Language: '),
              LanguageToggle(),

            ],),

            const Spacer(),
            CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              '${AppLocalizations.of(context)!.version}: 1.0.0',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}






