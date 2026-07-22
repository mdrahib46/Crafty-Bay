
import 'package:craftybay/features/auth/data/model/sign_in_arguments.dart';
import 'package:flutter/material.dart';

import '../../../../app/controller/auth_controller.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentation/main_bottom_nav_screen.dart';
import '../../../shared/widgets/theme_toggle.dart';
import '../../../shared/widgets/toggle_language.dart';
import '../widgets/app_logo.dart';
import 'sign_in_screen.dart';

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

    bool isLoggedIn = await AuthController.isUserLoggedIn();

    if (isLoggedIn) {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainBottomNavScreen.name,
          (route) => false,
        );
      }
    } else {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          SignInScreen.name,
          (route) => false,
          arguments: SignInArguments(allowSkip: true, returnAfterLogin:  false)
        );
      }
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
              children: [const Text('Language: '), LanguageToggle()],
            ),

            const Spacer(),
            CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              '${context.localization.version}: 1.0.0',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
