
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentation/main_bottom_nav_screen.dart';
import '../../../shared/utils/validators.dart';
import '../../../shared/widgets/center_circular_progress_indicator.dart';
import '../../../shared/widgets/show_snackbar_message.dart';
import '../../data/model/sign_in_params.dart';
import '../provider/sign_in_provider.dart';
import '../widgets/app_logo.dart';
import 'sign_up_screen.dart';

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

  final SignInProvider _signInProvider = SignInProvider();

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;

    return ChangeNotifierProvider.value(
      value: _signInProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 80),
                          AppLogo(),
                          Text(
                            localization.welcomeBack,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            localization.signInWithEmailPassword,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 20),

                          TextFormField(
                            controller: _emailTEController,
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
                            controller: _passTEController,
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintText: context.localization.password,
                            ),
                            validator: (String? input) =>
                                Validators.validatePassword(input),
                          ),
                          const SizedBox(height: 20),

                          Consumer<SignInProvider>(
                            builder: (context, _, child) {
                              if (_signInProvider.signInInProgress) {
                                return CenterCircularProgressIndicator();
                              } else {
                                return FilledButton(
                                  onPressed: _onTapSingIn,
                                  child: Text(localization.signIn),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: localization.dontHaveAnAccount,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: localization.signUp,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: AppColors.themeColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _navigateToSignUpScreen,
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(localization.forgotPassword),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  void _onTapSingIn() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    SignInParams signInParams = SignInParams(
      email: _emailTEController.text.trim(),
      password: _passTEController.text,
    );

    final bool isSuccess = await _signInProvider.signIn(signInParams);

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainBottomNavScreen.name,
        (route) => false,
      );
    } else {
      showSnackBarMessage(
        context,
        _signInProvider.errorMessage!,
        isError: true,
      );
    }
  }

  void _navigateToSignUpScreen() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passTEController.dispose();
    super.dispose();
  }
}
