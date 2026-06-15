import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/features/auth/presentation/widgets/app_logo.dart';
import 'package:craftybay/features/common/presentation/screen/main_bottom_nav_screen.dart';
import 'package:craftybay/features/shared/presentation/utils/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppLogo(),
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Sign in with your email and password',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: context.localization.email,
                    ),
                    validator: (String? input) =>
                        Validators.validateEmail(input),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: context.localization.password,
                    ),
                    validator: (input) => Validators.validatePassword(input),
                  ),
                  const SizedBox(height: 20),

                  FilledButton(onPressed: _onTapSingIn, child: Text('Sign In')),
                  const SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColors.themeColor,
                                fontWeight: FontWeight.w500,
                              ),
                          recognizer: TapGestureRecognizer()..onTap = _navigateToSignUpScreen
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSingIn() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainBottomNavScreen.name,
        (route) => false,
      );
    }
  }

  void _navigateToSignUpScreen() {}

  @override
  void dispose() {
    _emailTEController.dispose();
    _passTEController.dispose();
    super.dispose();
  }
}
